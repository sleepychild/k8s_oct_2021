#!/usr/bin/env bash

# "${1}" is '*'
# "${2}" is 'main'

sleep 1m # Wait for the machine to come up

sudo salt '*' state.apply # top.sls on all

sudo salt '*' state.apply 07_docker_install
sudo salt '*' state.apply 07_docker_start

sudo salt '*' state.apply 08_kubernetes_install

sudo salt 'main' state.apply 08_kubernetes_config

sudo salt 'main' state.apply 08_kubernetes_dashboard

# sudo salt 'node1' state.apply 08_kubernetes_join

# sudo salt 'node2' state.apply 08_kubernetes_join

# sudo salt 'main' state.apply 09_terraform_install

# sudo salt 'main' state.apply 09_helm_install

# sudo salt 'main' state.apply 09_kompose_install

# sudo salt 'main' state.apply 10_concourse

# sudo salt 'main' state.apply 99_run_deploy
