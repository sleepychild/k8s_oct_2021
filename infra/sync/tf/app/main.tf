terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.14.0"
    }
  }
}

provider "docker" {
  host = "tcp://main:2375/"
}

# One way to deliver the project's files to the Docker host
resource "null_resource" "files" {
  # triggers = {
  #   php_image_id = docker_image.app1.id
  # }

  provisioner "local-exec" {
    command = " rm -rf project || true "
  }

  provisioner "local-exec" {
    command = " git clone https://github.com/sleepychild/dof-exam-2021.git project "
  }

}

resource "docker_image" "app1" {
  name = "app1"
  build {
    path = "/sync/tf/app/project/app1/image/"
  }
}

resource "docker_container" "app1" {
  name  = "app1"
  image = docker_image.app1.latest
  env = ["APP_VARIABLE=@sleepychild"]
  ports {
    internal = 80
    external = 8080
  }
  # Files are on the Docker host - either copied manually or by using some sort of automation
  volumes {
    host_path      = "/sync/tf/app/project/app1/image/app/"
    container_path = "/var/www/html"
    read_only      = true
  }
  depends_on = [
    null_resource.files,
  ]
}
