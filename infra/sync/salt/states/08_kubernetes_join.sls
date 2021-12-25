cluster.join:
  cmd.run:
    - name: kubeadm join 192.168.120.100:6443 --token abcdef.1234567890abcdef --discovery-token-ca-cert-hash sha256:`cat /sync/k8s/hash.txt`