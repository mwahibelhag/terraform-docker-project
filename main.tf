terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.15.0" # قمنا بتغيير الإصدار هنا لحل مشكلة التوافق
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "nginx_server" {
  name  = "nginx-server"
  image = docker_image.nginx.latest # قمنا بتغيير .name إلى .latest لتتوافق مع الإصدار الأقدم
  ports {
    internal = 80
    external = 8080
  }
}
