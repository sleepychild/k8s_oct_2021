#!/usr/bin/env bash

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.4.0/aio/deploy/recommended.yaml
kubectl apply -f /sync/k8s/dashboard-svc.yml
kubectl apply -f /sync/k8s/dashboard-admin-user.yml
kubectl apply -f /sync/k8s/dashboard-admin-role.yml
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}') > /sync/k8s/admin-user-token.txt
grep -E "^token:" /sync/k8s/admin-user-token.txt | tr -s " " | cut -d " " -f 2 > /sync/k8s/token
