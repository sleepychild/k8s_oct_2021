# Core Concepts

## Containerization

OS-Level Virtualizaion via isolation. A shared kernel providing multiple **isolated** user space instances know as **containers** or **zones** or **jails**. Often compared to virtualization. 

### Container

A runnable instance of an image. An **isolated** process executing the image in a **cgroup**.

### Image

A read only template for a container instance. Composed of seperate **layers** containing the needed environment and application files needed to run isolated within the container. Layers become merged with the content from each new layer overwriting ( if necesary ) the previous ones.

#### Layers

 - Writable / Container **Volume** e.g. runtime files
 - application code
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

 - minikube Works on top of a hypervisor and requires kubectl
 - kind Is k8s in Docker

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

## k8s objects

Objects are persistent entities. They are a record of intent for the cluster to keep the desired state.
Objects have a **Spec** describing the desired and **Status** for the current state.
Objects are Pods Services Namespaces Volumes etc.

### Namespaces

Allow a definition of a virtual cluster. Provides object name scope. Most objects are within a namespace and they can be in only one namespace. Namespaces can't be nested in other namespaces. Nodes are also not within a namespace. Deleting a namespace also deletes everything within it.

### Pods

The pod is the smallest unit of scheduling. It is defined by a manifest file. A pod hosts one main conatainer and additional supporting containers. The pod is an atomic element and it get's deployed on a single node with all of it's containers toether. It can't be split across 2 or more nodes. The pods house a special infra container that is transparet to the platform user and is tasked with system / infra "work".

Each pod has a unique IP address. It is part of the pod network. Inter-pod communication is via pod network. Intra-pod communication is via localhost and port.

#### Pod Manifest Example

```yaml
apiVersion: v1
kind: Pod
metadata:
 name: appa-pod
spec:
 containers:
 - name: appa-container
   image: shekirev/k8s-appa:v1
   ports:
   - containerPort: 80
```

#### Labels / Annotations

Key-Value pairs attached to objects.
Each object may have multiple.
Each can be attached to multiple objects.

##### Labels

Used to identify and group sets of objects.
Used with the label selectors.

##### Annotations

Used to store additional metadata.

### Services

Provides reliable network endpoint:
 - IP Address
 - DNS name
 - Port

This exposes pods to the outside world. Use **end point** object to track pods. Uses **label selectros** to do their magic.

#### Service Types

 - **ClusterIP** exposes the service on a cluster-internal IP. This way the service will be only reachable from within the cluster. **This is the default**.

 - **NodePort** exposes the service on each Node's IP at a static port specified. A ClusterIP Service to which the NodePort Service routes is automatically created. We can contact the NodePort Service from outside the cluster by requesting <AnyNodeIP>:<NodePort>. Default range is between 30000 and 32767.
 
 - **LoadBalancer** exposes the Service externally using a cloud provider's load balancer. NodePort and ClusterIP Services to which the external load balancer routes are created automatically.
 
 - **ExternalName** maps the Service to the contents of the externalName field by returning a CNAME record with its value. No proxying of any kind is set up.

#### Service Manifest Example

```yaml
apiVersion: v1
kind: Service
metadata:
 name: appa-svc
 labels:
  app: appa
spec:
 type: NodePort
 ports:
 - port: 80
   nodePort: 30001
   protocol: TCP
selector:
 app: appa
```

### Object Management

Imperative commands invoked for single tasks.

Imperative object configuration for modifying target object definition.

Declarative object configuration via files.
