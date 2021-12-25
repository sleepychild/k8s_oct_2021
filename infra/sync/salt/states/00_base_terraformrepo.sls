addrepo.terraform:
  cmd.script:
    - name: "Add Terraform Repo"
    - source: "/sync/scripts/tf_repo.sh"
    - retry:
        attempts: 10
        until: True
        interval: 60
        splay: 10
