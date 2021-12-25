concourse:
  cmd.script:
    - name: "Run Concourse"
    - runas: root
    - source: "/sync/scripts/concourse.sh"
    - creates: 
      - concourse/docker-compose.yml
    - retry:
        attempts: 2
        until: True
        interval: 5
        splay: 5

fly:
  cmd.script:
    - name: "Run Concourse"
    - runas: root
    - source: "/sync/scripts/concourse.sh"
    - creates: 
      - /usr/local/bin/fly
    - retry:
        attempts: 5
        until: True
        interval: 5
        splay: 5
