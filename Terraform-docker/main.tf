terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_container" "nodered_container" {
  name  = "nodered-container"
  image = "nodered/node-red:latest"

  ports {
    internal = 1880
    external = 1880
  }
}

resource "docker_container" "ubuntu_container" {
  name  = "ubuntu-container"
  image = "ubuntu:latest"
  command = ["sleep", "infinity"]
  ports {
    internal = 56899
    external = 56899
  }
}

resource "docker_container" "debian_container" {
  name  = "debian-container"
  image = "debian:latest"
  command = ["sleep", "infinity"]
  ports {
    internal = 8908
    external = 8908
  }
}


resource "docker_container" "postgresql_container" {
  name  = "postgresql-container"
  image = "postgres:latest"
  command = ["sleep", "infinity"]
  ports {
    internal = 5432
    external = 5432
  }
}

resource "docker_container" "jenkins_container" {
  name  = "jenkins-container"
  image = "jenkins/jenkins:lts-jdk11"
  command = ["sleep", "infinity"]
  ports {
    internal = 9090
    external = 9090
  }
}

  


