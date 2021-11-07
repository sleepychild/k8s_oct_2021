#!/bin/bash

# install dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.4.0/aio/deploy/recommended.yaml

# setup dashboard user
kubectl apply -f dashboard-adminuser.yml
kubectl apply -f cluster-role-binding.yml

# to enable dashboard access start kubectl proxy
kubectl proxy

# get dashboard token
kubectl -n kubernetes-dashboard get secret $(kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"

