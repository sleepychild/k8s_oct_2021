#!/usr/bin/env bash
vagrant destroy --force --parallel

# Clean tf garbage
shopt -s extglob
rm -rfv sync/tf/*/!("main.tf")

# Remove known hosts
ssh-keygen -f ~/.ssh/known_hosts -R "[localhost]:2222"
ssh-keygen -f ~/.ssh/known_hosts -R "[localhost]:2200"
ssh-keygen -f ~/.ssh/known_hosts -R "[localhost]:2201"
