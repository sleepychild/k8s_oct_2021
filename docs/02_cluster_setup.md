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

### Control Plane

### Memeber Nodes

### Pod Network

## Manage and Upgrade

## HA K8S Cluster