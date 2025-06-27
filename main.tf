terraform {
required_providers {
docker = {
source = "kreuzwerker/docker"
version = "~> 3.0"
}
nginx = {
      source  = "getstackhead/nginx"
      version = "~> 1.3.0"
    }
}
}

provider "docker" {}
provider "nginx"{}


resource "docker_network" "private_network" {
  name = var.network_name
}

resource "docker_image" "nginx" {
  name         = var.nginx_image
  keep_locally = false
}

resource "docker_image" "hello" {
  name         = var.hello_image
  keep_locally = false
}

resource "docker_container" "hello_container" {
  image = docker_image.hello.image_id
  name  = var.hello_container_name

  volumes {
    host_path      = abspath("${path.module}/nginx-html")
    container_path = "/usr/share/nginx/html"
  }
  env = [
  "APP_MODE = production",
  "GREETING = Welcome to ADS container!!"
]
  ports {
    internal = 80
    external = var.hello_port
  }

  networks_advanced {
    name = docker_network.private_network.name
  }
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = var.nginx_container_name
  log_driver = "json-file"

  log_opts = {
  "max-size" = "10m"
  "max-file" = "3"
  }

  ports {
    internal = 80
    external = var.nginx_port
  }

  networks_advanced {
    name = docker_network.private_network.name
  }
}

