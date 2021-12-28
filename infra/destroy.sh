#!/usr/bin/env bash
vagrant destroy --force --parallel

# Clear k8s hashes
rm -v sync/k8s/token
rm -v sync/k8s/admin-user-token.txt 
rm -v sync/k8s/hash.txt

# Remove known hosts
ssh-keygen -f ~/.ssh/known_hosts -R "[localhost]:2222"
ssh-keygen -f ~/.ssh/known_hosts -R "[localhost]:2200"
ssh-keygen -f ~/.ssh/known_hosts -R "[localhost]:2201"
