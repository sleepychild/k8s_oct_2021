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

dashboard.token.only:
  cmd.run:
    - name: grep -E "^token:" /sync/k8s/admin-user-token.txt | tr -s " " | cut -d " " -f 2 > /sync/k8s/token

# dashboard.svc:
#   cmd.run:
#     - name: kubectl apply -f /sync/dashboard-svc/dashboard-svc.yml
