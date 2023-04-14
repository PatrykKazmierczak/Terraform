


#-------------------------------------------------------------Terraform-AWS----------------------------------------------------------------
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.63.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
  
}


resource "aws_s3_bucket" "aws_s3_bucket" {
  bucket = "aws-s3-bucket-pkaz-devops"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

#-------------------------------------------------------------Terraform-Docker----------------------------------------------------------------

# terraform {
#   required_providers {
#     docker = {
#       source  = "kreuzwerker/docker"
#       version = "3.0.2"
#     }
#   }
# }


# provider docker {}
# #-------------------------------------------------------------Terraform-Docker-Variables----------------------------------------------------------------

# variable "ext_port" {
#   type = number
#   default =1880
# }

# variable "int_port" {
#   type = number
#   default = 1880
  
# }

# variable "cont_count" {
#   type = number
#   default = 1
# }

# #-------------------------------------------------------------Terraform-Docker-Images----------------------------------------------------------------

# resource "docker_image" "nodered_image" {
#   name = "nodered/node-red:latest"
  
# }

# resource "docker_image" "ubuntu_image" {
#   name = "ubuntu:latest"
  
# }

# resource "docker_image" "debian_image" {
#   name = "debian:latest"
  
# }

# resource "docker_image" "postgresql_image" {
#   name = "postgres:latest"
  
# }

# resource "docker_image" "jenkins_image" {
#   name = "jenkins/jenkins:lts-jdk11"
  
# }

# #-------------------------------------------------------------Terraform-Random-String----------------------------------------------------------------


# resource "random_string" "random" {
#   length = 6
#   special = false
#   upper = false
# }

# resource "random_string" "random_2" {
#   count = 1
#   length = 7
#   special = false
#   upper = false
# }

# #------------------------------------------------------------Terraform-Docker-Container----------------------------------------------------------------

# resource "docker_container" "nodered_container" {
#   count = var.cont_count
#   name  = join("-",["nodered-container", random_string.random_2[count.index].result])
#   image = docker_image.nodered_image.name
#   ports {
#     internal = var.int_port
#     external = var.ext_port
#   }
# }

# resource "docker_container" "ubuntu_container" {
#   name  = join("-",["ubuntu-container", random_string.random.result])
#   image = docker_image.ubuntu_image.name
#   command = ["sleep", "infinity"]
#   ports {
#     internal = var.int_port
#     #external = 56899 Docker will assign random external port
#   }
# }

# resource "docker_container" "debian_container" {
#   name  = join("-",["debian-container", random_string.random.result])
#   image = docker_image.debian_image.name
#   command = ["sleep", "infinity"]
#   ports {
#     internal = var.int_port
#     #external = 8908 Docker will assign random external port
#   }
# }

# resource "docker_container" "postgresql_container" {
#   name  = join("-",["postgresql-container", random_string.random.result])
#   image = docker_image.postgresql_image.name
#   command = ["sleep", "infinity"]
#   ports {
#     internal = var.int_port
#     #external = 5432 Docker will assign random external port
#   }
# }

# resource "docker_container" "jenkins_container" {
#   name  = join("-",["jenkins-container", random_string.random.result])
#   image = docker_image.jenkins_image.name
#   command = ["sleep", "infinity"]
#   ports {
#     internal = var.int_port
#     #external = 9090  Docker will assign random external port
#   }
# }

# #------------------------------------------------------------Terrform-Import-Example----------------------------------------------------------------

# # terraform import docker_container.ubuntu_container_2 $(docker inspect --format="{{.ID}}" ubuntu-container-37gjd6)

# # resource "docker_container" "ubuntu_container_2" {
# #   name = "ubuntu-container-37gjd6"
# #   image = docker_image.ubuntu_image.name
  
# # }

# #----------------------------------------------------------------Terrform-Output----------------------------------------------------------------

# output "ip-address" {
#   value = join("\n ",  flatten([docker_container.nodered_container[*].name, 
#                                 docker_container.nodered_container[*].network_data[*].ip_address,
#                                 docker_container.nodered_container[*].ports[*].external]))
#   description = "The IP address and external port of the container"
# }

# output "ip-address-and-ports-nodered" {
#   value = [for i in docker_container.nodered_container[*]: join(":",i.network_data[*]["ip_address"], i.ports[*]["external"], i.name[*])]
#   description = "The IP address and external port of the container"
# }

# output "ip-address-and-ports-ubuntu" {
#   value = [for i in docker_container.ubuntu_container[*]: join(":",i.network_data[*]["ip_address"], i.ports[*]["external"], i.name[*])]
#   description = "The IP address and external port of the container"
# }

# output "ip-address-and-ports-jenkins" {
#   value = [for i in docker_container.jenkins_container[*]: join(":",i.network_data[*]["ip_address"], i.ports[*]["external"], i.name[*])]
#   description = "The IP address and external port of the container"
# }

# output "ip-address-and-ports-debian" {
#   value = [for i in docker_container.debian_container[*]: join(":",i.network_data[*]["ip_address"], i.ports[*]["external"], i.name[*], i.network_data[*]["mac_address"])]
#   description = "The IP address and external port of the container"
# }

# output "ip-address-and-ports-postgresql" {
#   value = [for i in docker_container.postgresql_container[*]: join(":",i.network_data[*]["ip_address"], i.ports[*]["external"], i.name[*], i.network_data[*]["mac_address"])]
#   description = "The IP address and external port of the container"
# }





  

