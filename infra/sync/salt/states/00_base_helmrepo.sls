addrepo.helm:
  cmd.script:
    - name: "Add Helm Repo"
    - source: "/sync/scripts/helm_repo.sh"
    - creates:
      - /etc/apt/sources.list.d/helm-stable-debian.list
    - retry:
        attempts: 10
        until: True
        interval: 60
        splay: 10
