deploy:
  cmd.run:
    - name: "/sync/scripts/tfdeploy.sh app"
    
check:
  cmd.run:
    - name: 'curl "http://localhost:8080"'
    - require:
      - cmd: deploy
    - retry:
        attempts: 3
        until: True
        interval: 5
        splay: 5