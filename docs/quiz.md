# Quiz

Exam Prep Quiz [Link](https://zahariev.pro/q/k8s/index.php)

## Quiz Prep

### What is the default tag if no tag specified for a container image?
 - [ ] last
 - [x] latest
 - [ ] newest
 - [ ] none it is mandatory attribute

### Which TWO are valid types of a Service?
 - [x] LoadBalancer
 - [ ] Internal
 - [ ] ExternalIP
 - [x] ClusterIP

### Which object ype gives us a mechanism to distribute workload on all eligible nodes?
 - [ ] Deployment
 - [ ] StatefulSet
 - [ ] ReplicaSet
 - [x] DaemonSet

### How, by which other object, Deployment controls pod copies?
 - [ ] ReplicationController
 - [x] ReplicaSet
 - [ ] StatefulSet
 - [ ] DaemonSet

### What is the purpose of the init containers?
 - [ ] No such containers
 - [ ] Act as adapters for the main containers
 - [x] Prepare the environment for the application containers
 - [ ] Act as sidecars for the main containers

### Which service type is assumed by default?
 - [ ] LoadBalancer
 - [ ] NodePort
 - [x] ClusterIP
 - [ ] ExternalName

### Which TWO are valid ways to assign a pod to a node?
 - [ ] podSelector
 - [x] nodeSelector
 - [ ] Label Selector
 - [x] nodeName

### Which TWO Pod Network plugins support network policies?
 - [ ] RouterNet
 - [x] Antrea
 - [ ] Flannel
 - [x] WeaveNet

### Which, by default, is the lowest node port number?
 - [ ] 32 000
 - [x] 30 000
 - [ ] 3 000
 - [ ] 32 767

### Which is NOT a valid multi-container pattern?
 - [ ] Adapter
 - [ ] Ambassador
 - [ ] Sidecar
 - [x] Helper

## M1

### Which is NOT a responsibility of the kubelet?
 - [ ] Reports back to the Control Plane
 - [ ] Creates pods
 - [x] Provides the networking
 - [ ] Listens to the API Server

### Which Control Plane component maintains the desired state?
 - [x] Controller Manager
 - [ ] Persistent Store
 - [ ] API Server
 - [ ] Scheduler

### Which is NOT a valid service type?
 - [x] Ingress
 - [ ] ClusterIP
 - [ ] NodePort
 - [ ] LoadBalancer

### Which is the smallest unit of scheduling in Kubernetes?
 - [ ] ReplicaSet
 - [x] Pod
 - [ ] Deployment
 - [ ] StatefulSet

### What level of isolation is offered by containers?
 - [x] Lightweight
 - [ ] Transparent
 - [ ] Full
 - [ ] Complete

## M2

### Which component can be external when implementing high availability for the contnrol plane?
 - [ ] API Server
 - [ ] Scheduler
 - [x] etcd
 - [ ] Controller Manager

### Workload migration is initiated with?
 - [ ] Move
 - [ ] Eviction
 - [ ] Cordon
 - [x] Drain

### What is the name of the process of deleting pods from a node and recreating them on another?
 - [ ] Scheduling
 - [ ] Cordoning
 - [ ] Scaling
 - [x] Eviction

### Which is NOT a valid Pod Network plugin?
 - [ ] Flannel
 - [ ] Calico
 - [x] CoreDNS
 - [ ] Antrea

### Which is the default cluster state database?
 - [ ] SQLite
 - [ ] MySQL
 - [ ] MongoDB
 - [x] etcd

## M3

### Which is NOT a valid combination?
 - [ ] ClusterRole-RoleBinding
 - [ ] Role-RoleBinding
 - [ ] ClusterRole-ClusterRoleBinding
 - [x] Role-ClusterRoleBinding

### Which Pod Network plugin does NOT support Network Policies?
 - [ ] Calico
 - [x] Flannel
 - [ ] Antrea
 - [ ] Cilium

### Which is NOT part of the access control process?
 - [ ] Authorization
 - [ ] Authentication
 - [x] Filtering
 - [ ] Admission Control

### What requests are ignored by Admission Controllers?
 - [ ] Delete
 - [ ] Modify
 - [x] Read
 - [ ] Create

### Which is the first phase of the access control process?
 - [ ] Authorization
 - [ ] Admission Control
 - [x] Authentication
 - [ ] Delegation

## M4

### Which is NOT a valid Persistent Volume type?
 - [x] tempfs
 - [ ] local
 - [ ] nfs
 - [ ] cephfs

### Which is NOT a valid Persistent Volume phase?
 - [ ] Failed
 - [x] Created
 - [ ] Released
 - [ ] Available

### What is the maximum size of data that can be stored by a ConfigMap?
 - [ ] 100 MiB
 - [ ] 10 MiB
 - [ ] 1 GiB
 - [x] 1 MiB

### Which is NOT a valid Persistent Volume access mode?
 - [ ] ReadOnlyMany
 - [ ] ReadWriteOnce
 - [ ] ReadWriteMany
 - [x] ReadOnlyOnce

### Which is NOT a valid Persistent Volume reclaim policy?
 - [ ] Retain
 - [ ] Recycle
 - [ ] Delete
 - [x] Recreat

## M5

### Which component manages the static pods?
 - [x] kubelet
 - [ ] API Server
 - [ ] Scheduler
 - [ ] Container Runtime

### Which is NOT a valid pattern for an application container in a multi-container pod?
 - [ ] Adapter
 - [x] Translator
 - [ ] Ambassador
 - [ ] Sidecar

### Which is NOT a valid taint effect?
 - [x] PreferNoExecute
 - [ ] NoSchedule
 - [ ] PreferNoSchedule
 - [ ] NoExecute

### Which is NOT a valid autoscaling type?
 - [x] Scale up the cluster
 - [ ] Scale out the pods
 - [ ] Scale out the cluster
 - [ ] Scale up the pods

### Which workload resource allows scheduled execution?
 - [ ] Job
 - [ ] StatefulSet
 - [ ] DaemonSet
 - [x] CronJob

## M6

### Which is NOT a valid probe status?
 - [x] Wating
 - [ ] Success
 - [ ] Failure
 - [ ] Unknown

### Which probe, when failed, removes endpoints from a service?
 - [x] Readiness
 - [ ] None
 - [ ] Startup
 - [ ] Liveness

### Which is the default container restart policy in a pod?
 - [ ] Never
 - [ ] OnFailure
 - [ ] OnTerminate
 - [x] Always

### Which is NOT a valid probe check method?
 - [ ] Exec
 - [ ] TCP
 - [ ] HTTP
 - [x] Scan

### Which is NOT a valid probe?
 - [ ] Liveness
 - [ ] Readiness
 - [x] Status
 - [ ] Startup

## M7

### What is the name of the outcome in a cluster when applying an overlay to a base with kustomize?
 - [ ] Deployment
 - [x] Variant
 - [ ] Application
 - [ ] Patch

### Imagine that there is a value replicaCount. How can we use it in a manifest?
 - [x] {{ .Values.replicaCount }}
 - [ ] {{ .replicaCount }}
 - [ ] {{ Values.replicaCount }}
 - [ ] {{ .Chart.replicaCount }}

### What is the term for an installed Helm chart?
 - [ ] Chart
 - [ ] Installation
 - [ ] Deployment
 - [x] Release

### Which file contains information about the chart?
 - [x] Chart.yaml
 - [ ] chart.yaml
 - [ ] template.yaml
 - [ ] helm.yaml

### Which file contains the default configuration values for a chart?
 - [x] values.yaml
 - [ ] default.yaml
 - [ ] configuration.yaml
 - [ ] Values.yaml

## Quiz A

### Which resource allows workload distribution to every eligible node?
 - [ ] Deployment
 - [ ] StatefulSet
 - [ ] CronJob
 - [x] DaemonSet

### If a Pod is in pending state, which is the most probable cause for this?
 - [ ] Wrong image architecture
 - [ ] Manifest error
 - [ ] Missing image
 - [x] Lack of resources

### Which component is responsible for pulling the container images?
 - [ ] Scheduler
 - [ ] Controller Manager
 - [x] Container Runtime
 - [ ] Kubelet

### Which is NOT part of the worker nodes?
 - [x] Controller Manager
 - [ ] Container Runtime
 - [ ] Kubelet
 - [ ] Kube Proxy

### Which could NOT be a subject of a RoleBinding or ClusterRoleBinding?
 - [ ] Service Accounts
 - [ ] Users
 - [x] Objects
 - [ ] Groups

### Which component is upgraded first, when upgrading clusters created with kubeadm?
 - [ ] etcd
 - [ ] kubectl
 - [ ] kubelet
 - [x] kubeadm

### Which construct will return the release name in a manifest?
 - [ ] {{ Release.Name }}
 - [ ] $Release.Name
 - [x] {{ .Release.Name }}
 - [ ] {{ ReleaseName }}

### What is the type of relation during the PVC to PV binging process?
 - [ ] many-to-many
 - [x] one-to-one
 - [ ] many-to-one
 - [ ] one-to-many

### Which is the last step of the access control process?
 - [ ] Filtering
 - [x] Admission Control
 - [ ] Authentication
 - [ ] Authorization

### Which is NOT a valid Audit level?
 - [x] RequestComplete
 - [ ] Metadata
 - [ ] Request
 - [ ] RequestResponce

## Quiz B

### What is the action that marks a node as unavailable for new work?
 - [ ] Taint
 - [ ] Uncordon
 - [x] Cordon
 - [ ] Drain

### What we do NOT store in screts?
 - [ ] Token
 - [ ] Password
 - [x] Configuration
 - [ ] Key

### What is the default maximum value for a NodePort?
 - [ ] 32000
 - [ ] 32565
 - [x] 32767
 - [ ] 31656

### Which is the default service type?
 - [x] ClusterIP
 - [ ] LoadBalancer
 - [ ] NodePort
 - [ ] ExternalName

### What is the allowed difference between the version of kubectl and the cluster?
 - [ ] No difference allowed
 - [ ] (+/-) 2 minor versions
 - [x] (+/-) 1 minor version
 - [ ] (+/-) 1 major version

### What additional template is part of the manifest of a StatefulSet?
 - [ ] Replication Controller
 - [x] Volume Claim
 - [ ] Volume
 - [ ] Replica Set

### Which is NOT true about namespaces?
 - [ ] Each object can be in only one namespace
 - [ ] Namespaces provde scope for names
 - [x] Namespaces can be nested
 - [ ] Deleting a namespace will delete everything in it

### In a multi-container pod, what is the name of the containers that are executed before all others?
 - [ ] Application Containers
 - [ ] Sidecar Containers
 - [ ] Adapter Containers
 - [x] Init Containers

### Which service type opens the same port on every node in the cluster?
 - [ ] ClusterIP
 - [ ] PortNode
 - [ ] LoadBalancer
 - [x] NodePort

### What object is used by the deployments to scale the pods?
 - [ ] StatefulSet
 - [ ] PodAutoScaler
 - [ ] ReplicationController
 - [x] ReplicaSet
