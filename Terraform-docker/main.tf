terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {}

resource "random_string" "random" {
  length = 6
  special = false
  upper = false
}

resource "random_string" "random_2" {
  count = 2
  length = 6
  special = false
  upper = false
}

resource "docker_container" "nodered_container" {
  count = 2
  name  = join("-",["nodered-container", random_string.random_2[count.index].result])
  image = "nodered/node-red:latest"

  ports {
    internal = 1880
    #external = 1880 Docker will assign random external port
  }
}

resource "docker_container" "ubuntu_container" {
  name  = join("-",["ubuntu-container", random_string.random.result])
  image = "ubuntu:latest"
  command = ["sleep", "infinity"]
  ports {
    internal = 56899
    #external = 56899 Docker will assign random external port
  }
}

resource "docker_container" "debian_container" {
  name  = join("-",["debian-container", random_string.random.result])
  image = "debian:latest"
  command = ["sleep", "infinity"]
  ports {
    internal = 8908
    #external = 8908 Docker will assign random external port
  }
}

resource "docker_container" "postgresql_container" {
  name  = join("-",["postgresql-container", random_string.random.result])
  image = "postgres:latest"
  command = ["sleep", "infinity"]
  ports {
    internal = 5432
    #external = 5432 Docker will assign random external port
  }
}

resource "docker_container" "jenkins_container" {
  name  = join("-",["jenkins-container", random_string.random.result])
  image = "jenkins/jenkins:lts-jdk11"
  command = ["sleep", "infinity"]
  ports {
    internal = 9090
    #external = 9090  Docker will assign random external port
  }
}



# output "Container-Name-Ip-ExternalPort" {
#   value = join("\n", [
#     join(": -> ", [docker_container.nodered_container[*].name, docker_container.nodered_container[0].network_data[0].ip_address, docker_container.nodered_container[0].ports[0].external]),
#     join(": -> ", [docker_container.ubuntu_container[*].name, docker_container.ubuntu_container.network_data[0].ip_address, docker_container.ubuntu_container.ports[0].external]),
#     join(": -> ", [docker_container.debian_container[*].name, docker_container.debian_container.network_data[0].ip_address, docker_container.debian_container.ports[0].external]),
#     join(": -> ", [docker_container.postgresql_container[*].name, docker_container.postgresql_container.network_data[0].ip_address, docker_container.postgresql_container.ports[0].external]),
#     join(": -> ", [docker_container.jenkins_container[*].name, docker_container.jenkins_container.network_data[0].ip_address, docker_container.jenkins_container.ports[0].external])
#   ])
#   description = "The names and network data of all containers"
# }

# output "ip-address" {
#   value = join("\n ",  flatten([docker_container.nodered_container[*].name, 
#                       docker_container.nodered_container[*].network_data[*].ip_address,
#                       docker_container.nodered_container[*].ports[*].external]))
#   description = "The IP address and external port of the container"
# }

output "ip-address-and-ports-nodered" {
  value = [for i in docker_container.nodered_container[*]: join(":",i.network_data[*]["ip_address"], i.ports[*]["external"], i.name[*])]
  description = "The IP address and external port of the container"
}

output "ip-address-and-ports-ubuntu" {
  value = [for i in docker_container.ubuntu_container[*]: join(":",i.network_data[*]["ip_address"], i.ports[*]["external"], i.name[*])]
  description = "The IP address and external port of the container"
}

output "ip-address-and-ports-jenkins" {
  value = [for i in docker_container.jenkins_container[*]: join(":",i.network_data[*]["ip_address"], i.ports[*]["external"], i.name[*])]
  description = "The IP address and external port of the container"
}

output "ip-address-and-ports-debian" {
  value = [for i in docker_container.debian_container[*]: join(":",i.network_data[*]["ip_address"], i.ports[*]["external"], i.name[*])]
  description = "The IP address and external port of the container"
}

output "ip-address-and-ports-postgresql" {
  value = [for i in docker_container.postgresql_container[*]: join(":",i.network_data[*]["ip_address"], i.ports[*]["external"], i.name[*], i.network_data[*]["mac_address"])]
  description = "The IP address and external port of the container"
}





  

