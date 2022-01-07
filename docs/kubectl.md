# kubectl

Used to control k8s clusters. Expects a file named config in ~/.kube directory. Other files can be specified by setting the KUBECONFIG end var or by passing the --kubeconfig flag. The kubectl version should be +/- 1 minor version compared to the cluster.

Base syntax: ```kubectl {command} {TYPE} {NAME} {flags}```
 - command is the operation e.g run , get ...
 - TYPE is the resource type e.g. pod, service ...
 - NAME is case-sensitive identifyer
 - flags ...

# Contexts

```bash
kubectl config get-contexts
kubectl config use-context {CONTEXT_NAME}
```