dashboard.install:
  cmd.run:
    - name: kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.4.0/aio/deploy/recommended.yaml

dashboard.useradd:
  cmd.run:
    - name: kubectl apply -f /sync/k8s/dashboard-admin-user.yml

dashboard.roleadd:
  cmd.run:
    - name: kubectl apply -f /sync/k8s/dashboard-admin-role.yml

dashboard.token:
  cmd.run:
    - name: kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}') > /sync/k8s/admin-user-token.txt

token.create:
  cmd.run:
    - name: kubeadm token create abcdef.1234567890abcdef

hash.create:
  cmd.run:
    - name: openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | sed 's/^.* //' > /sync/k8s/hash.txt
