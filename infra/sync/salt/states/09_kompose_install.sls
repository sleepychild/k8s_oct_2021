kompose.get:
  cmd.run:
    - name: curl -L https://github.com/kubernetes/kompose/releases/download/v1.22.0/kompose-linux-amd64 -o /usr/local/bin/kompose

/usr/local/bin/kompose:
  file.managed:
    - mode: 755