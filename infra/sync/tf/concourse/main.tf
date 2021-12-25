provider "concourse" {
  url  = "http://main:9000"
  team = "main"

  username = "test"
  password = "test"
}

resource "concourse_pipeline" "pipeline_name" {
  team_name     = "main"
  pipeline_name = "{pipeline_name}"

  is_exposed = true
  is_paused  = false

  pipeline_config        = file("{pipeline_name}.yml")
  pipeline_config_format = "yaml"
}
