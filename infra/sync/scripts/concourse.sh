#!/usr/bin/env bash

rm -rf concourse || true
mkdir concourse
pushd concourse
    curl -O https://concourse-ci.org/docker-compose.yml
    sed -i 's/8080:8080/9000:8080/g' docker-compose.yml
    sed -i 's/http:\/\/localhost:8080/http:\/\/localhost:9000/g' docker-compose.yml
    docker-compose up -d
    # rm docker-compose.yml
    # kompose convert
    # kubectl get pods
    # kubectl apply -f .
popd

# helm repo add concourse https://concourse-charts.storage.googleapis.com/
# helm install local_ci concourse/concourse
