#!/usr/bin/env bash

# Vagrant
vagrant up

source <(kubectl completion bash)
scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -P ${1} vagrant@localhost:/home/vagrant/.kube/config ~/.kube/config
