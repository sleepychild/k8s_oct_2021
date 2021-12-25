#!/usr/bin/env bash

pushd /usr/local/bin/
    curl -o fly "http://localhost:9000/api/v1/cli?arch=amd64&platform=linux"
    chmod 755 fly
popd
