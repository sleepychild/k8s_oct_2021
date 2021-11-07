# Core Concepts

## Containerization

OS-Level Virtualizaion via isolation.

### Container

A runnable instance of an image.

### Image

A read only template for a container instance

#### Layers

 - Writable / Container **Volume** e.g. application code / runtime files
 - software / Image **Layer** e.g. Python NGINX
 - os / Image **Layer** e.g. ubuntu alpine 

### Repository

A collection of different image versions identified by tags.

### Registry

A collection of repositories.

## Container orcestartion

### Aplication Evolution

Monolithic -> Microservices -> Containers

### New Demands

 - Workload deployment and distribution
 - Resource governance
 - Scalability and availability
 - Automatization and management
 - Internal and external communication

### k8s

The main work unit is the **pod**. Containers work inside **pod**s. One **pod** can have multiple containers running inside it.

 - Runs a cluster of hosts
 - Schedules containers to run on different hosts
 - Facilitates the communication between the containers
 - Provides and controls access to / from outside world
 - Tracks and optimizes the resource usage

Written in golang by google and donated to CNCF in 2014.

### Other solutions

 - Docker Swarm
 - HashiCorp Nomad
 - Apache Mesos + Marathon

## k8s Architecture

Can be run as a "All-in-One Single Node" or "Multi Node". 

Installation tools
 - kubeadm
 - KubeSpray
 - KOps

### Control Plane (master) Nodes

Responsible for managing the cluster. Typicaliy more than one in HA mode and one is elected as **Leader**. Node types:
 - **Persistent Store** based on etcd tassked with Persistent storage of cluster state and configuration. It is distributedd and consistent. Provdes single source of truth. Can be deployed externaly.
 - **API Server** exposes the k8s (REST) API. This is the control plane Front-end. Consumes JSON but via YAML Manifest files.
 - **Controller** executes the cluster controll loops for the different sub controllers e.g Node, Endpoints & Namespace. Watches for changes and maintaines the desired state.
 - **Scheduler** Listens to the API server for commands and assigns execution to work nodes.

### Worker Nodes
 - **Container Runtime** e.g. Docker, containerd, CRI-O, ... Responsible for container management (starting / stopping) and pulling images.
 - **kubelet** The main k8s agent responsible for node registration in the cluster. Listens to the API Server for commands and reports back to the contol plane. Negotiates pod creation with the container runtime. Exposes endpoints on port 10255 for /spec /healthz /pods.
 - **kube-proxy** handles networking. Each pod has its own address. All containers in a pod share the same IP address. Offers load balancing across all pods in a service.

### Distributions

#### Localhost
 - minikube
 - kind

#### On Premise
 - Minikube
 - MicroK8s
 - K3s
 - kOs
 - openSUSE Kubic
 - OpenShift
 - ...

#### Cloud Based
 - Azure Kubernetes Services
 - Elastic Container Service for Kubernetes
 - Google Kubernetes Engine
