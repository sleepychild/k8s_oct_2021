start.docker.socket:
  service.running:
    - name: docker.socket
    - enable: True
    - reload: True

start.docker:
  service.running:
    - name: docker
    - enable: True
    - reload: True
