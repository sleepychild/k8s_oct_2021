# Quiz

Exam Prep Quiz [Link](https://zahariev.pro/q/k8s/index.php)

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
