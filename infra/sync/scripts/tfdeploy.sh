#!/usr/bin/env bash

pushd /sync/tf/${1}
    terraform init
    terraform validate
    terraform plan -out main.plan
    terraform apply main.plan
popd
