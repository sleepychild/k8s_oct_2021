# Cluster Setup

## Instalation

### Prerequisites

 1. **We need** ```br_netfilter``` module.
    ```bash
    lsmod | grep br_netfilter # to check
    modprobe br_netfilter # to manually enable
    ```
    Ensure it is loaded by creating a file ```/etc/modules-load.d/k8s.conf``` with the contents... 
    ```bash
    br_netfilter
    ```

 1. **We need** to configure the network stack. Create a file ```/etc/sysctl.d/k8s.conf``` with the following contents...
    ```bash
    net.bridge.bridge-nf-call-ip6tables = 1
    net.bridge.bridge-nf-call-iptables = 1
    net.ipv4.ip_forward = 1
    ```
 1. **We need** to setup iptables (or to disable them). We prefer legacy iptables (for some reason).

 1. **We need** to disable swap.
    ```bash
    swapoff -a # disable
    sed -i '/swap/ s/^/#/' /etc/fstab # comment out swap from fstab file
    ```

 1. **We need** a container runtime. docker for example. it should be installed and working.

### Docker for k8s prerequisites

K8S require docker to use systemd as a cgroup driver. This is set in the docker daemon config file ```/etc/docker/daemon.json```. Example contents...

    ```json
    {
        "debug": true, 
        "tls": false, 
        "insecure-registries": ["192.168.201.120:5000"],
        "exec-opts": ["native.cgroupdriver=systemd"],
        "log-driver": "json-file",
        "log-opts": {
            "max-size": "100m"
        },
        "storage-driver": "overlay2"
    }
    ```

### Base Instalation

Install kubelet, kubeadm and kubectl from the k8s repo. We should block the packages from auto update with ```sudo apt-mark hold kubelet kubeadm kubectl```. Perhaps the same should be done with docker.

> Note: kublet daemon will not start succesfully after install due to configuration issues.

### Control Plane

To initialize k8s we use the kubeadm cmd.

```bash
kubeadm init --apiserver-advertise-address=192.168.120.100 --pod-network-cidr 10.244.0.0/16
```

The kubeadm cmd can also take it's parameters as a file.

### Memeber Nodes

To join the cluster we use the following.

```bash
# specific to our case !!!
kubeadm join 192.168.120.100:6443 --token abcdef.1234567890abcdef --discovery-token-ca-cert-hash sha256:`cat /sync/k8s/hash.txt`
```

### Pod Network

The kube-system coredns pods require a CNI to function propperly.

Flannel VS Calico and general [CNI comparison doc](https://www.suse.com/c/rancher_blog/comparing-kubernetes-cni-providers-flannel-calico-canal-and-weave/).

We will use flannel. It has a bug when used with vagrant b/c the first interface is NAT and flanneld binds to it. The solution is to modify the ```kube-flannel.yml``` file adding the ```- --iface=enp0s8``` argument to the ```/opt/bin/flanneld``` command.

```yml
      containers:
      - name: kube-flannel
        image: quay.io/coreos/flannel:v0.15.1
        command:
        - /opt/bin/flanneld
        args:
        - --ip-masq
        - --kube-subnet-mgr
        - --iface=enp0s8
```

## Manage and Upgrade

### Node Maintenance

To do maintenance on a node in the cluster we...
 * ```kubectl cordon {node_name}``` - make node unavailable for new work
 * ```kubectl drain {node_name}``` - migrate workload off of node (includes cordon)
 * Pods get **evicted** from the drained node
 * node is ready for maintenance
 * ```kubectl uncordon {node_name}``` - make node available for new work 

### Cluster state Backup / Restore

A **etcd** database holds the state. It runs on the control plane nodes (in our case). We use the **etcdctl** tool available from the **etcd-client** package. Relevant data about the etcd is stored in ```/etc/kubernetes/manifests/etcd.yaml```.

#### Backup
```bash
sudo ETCDCTL_API=3 etcdctl \
--endpoints=https://127.0.0.1:2379 \
--cacert=/etc/kubernetes/pki/etcd/ca.crt \
--cert=/etc/kubernetes/pki/etcd/server.crt \
--key=/etc/kubernetes/pki/etcd/server.key \
snapshot save /sync/etcd-snapshot.db
```
#### Restore
```bash
sudo ETCDCTL_API=3 etcdctl \
snapshot restore /sync/etcd-snapshot.db \
--data-dir /var/lib/etcd-restore
```
Then edit the etcd.yaml to set spec > volumes > hostPath named etcd-data > path to ```/var/lib/etcd-restore```. The cluster should pick up the change within a minute.

### Cluster update

First the control plane nodes one by one.
 - upgrade kubeadm
   ```bash
   apt-get install -y --allow-change-held-packages kubeadm=X.XX.X-XX
   ```
 - upgrade node
   ```bash
   source <(kubeadm completion bash)
   kubeadm upgrade plan
   kubeadm upgrade apply vX.XX.X
   ```
 - drain the node
   ```bash
   kubectl drain main # for example
   ```
 - upgrade other components ( e.g. kubectl & kubelet )
   ```bash
   apt-get install -y --allow-change-held-packages kubectl=X.XX.X-XX kubelet=X.XX.X-XX
   systemctl daemon-reload
   systemctl restart kubelet
   ```
 - uncordon the node
   ```bash
   kubectl uncordon main # for example
   ```

Then the pod nodes with the same approach. They should be drained and uncordoned from a control plane node.

> !!! We can't skip multiple versions !!!

> Note: you should use ```apt-get install -y --allow-change-held-packages {package}=X.XX.X-XX``` if you have apt-mark ed them to be held. 

## HA K8S Cluster

We need a load balancer in front of the control plane nodes. We use HA-Proxy.

### Stacked ETCD

### External ETCD
