terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  
}

resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"
}

resource "docker_image" "ubuntu_image" {
  name = "ubuntu"

  build {
    dockerfile = "ubuntu.Dockerfile"
    context    = "."
  }
}

resource "docker_container" "nodered_container" {
  name  = "nodered"
  image = docker_image.nodered_image.image_id

  ports {
    internal = 1880
    external = 1880
  }
}

resource "docker_container" "ubuntu_container" {
  name  = "ubuntu"
  image = docker_image.ubuntu_image.image_id

  ports {
    internal = 5668
    external = 5668
  }
}

  

