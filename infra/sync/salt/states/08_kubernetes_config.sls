cluster.init:
  cmd.run:
    - name: kubeadm init --apiserver-advertise-address=192.168.120.100 --pod-network-cidr 10.244.0.0/16

/root/.kube/config:
  file.copy:
    - source: /etc/kubernetes/admin.conf
    - makedirs: true
    - user: root
    - group: root
    - mode: 755

/home/vagrant/.kube/config:
  file.copy:
    - source: /etc/kubernetes/admin.conf
    - makedirs: true
    - user: vagrant
    - group: vagrant
    - mode: 755

/sync/etc/kubernetes/admin.conf:
  file.copy:
    - source: /etc/kubernetes/admin.conf
    - makedirs: true
    - user: vagrant
    - group: vagrant
    - mode: 755

node.taint:
  cmd.run:
    - name: kubectl taint nodes --all node-role.kubernetes.io/master-

token.create:
  cmd.run:
    - name: kubeadm token create abcdef.1234567890abcdef

hash.create:
  cmd.run:
    - name: openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | sed 's/^.* //' > /sync/k8s/hash.txt

# flannel.install:
#   cmd.run:
#     - name: kubectl apply -f /sync/flannel/kube-flannel.yml

calico.install:
  cmd.run:
    - name: kubectl create -f https://docs.projectcalico.org/manifests/tigera-operator.yaml

calico.config.0:
  cmd.run:
    - name: wget https://docs.projectcalico.org/manifests/custom-resources.yaml -O /tmp/custom-resources.yaml

calico.config.1:
  cmd.run:
    - name: sed -i 's/192.168.0.0/10.244.0.0/g' /tmp/custom-resources.yaml

calico.config.2:
  cmd.run:
    - name: kubectl create -f /tmp/custom-resources.yaml
