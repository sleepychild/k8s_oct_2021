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

We will use flannel.

## Manage and Upgrade

## HA K8S Cluster