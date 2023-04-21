
# variable "env" {
#   type = string
#   description = "Env to deploy to"
#   default = "dev"
  
# }

variable "image" {
  type = map
  description = "image for container"
  default = {
    dev = "nodered/node-red:latest"
    prod = "nodered/node-green:latest-minimal"
  }
}

variable "image_ubuntu" {
  type = map
  description = "image for container"
  default = {
    dev = "ubuntu:latest"
    prod = "ubuntu:latest-minimal"
  }
}

variable "image_debian" {
  type = map
  description = "image for container"
  default = {
    dev = "debian:latest"
    prod = "debian:latest-minimal"
  }
}

variable "image_postgresql" {
  type = map
  description = "image for container"
  default = {
    dev = "postgres:latest"
    prod = "postgres:latest-minimal"
  }
}

variable "image_jenkins" {
  type = map
  description = "image for container"
  default = {
    dev = "jenkins/jenkins:lts-jdk11"
    prod = "jenkins/jenkins:lts-jdk11-minimal"
  }
}


variable "ext_port" {
  type = map
  sensitive = true
 

  validation {
      condition = max(var.ext_port["dev"]...) <= 65535 && min(var.ext_port["dev"]...) >= 1980
      error_message = "Rhe external port must be in the valid port range 0 - 65535"
  }
  validation {
      condition = max(var.ext_port["prod"]...) < 1980 && min(var.ext_port["prod"]...) >= 1880
      error_message = "Rhe external port must be in the valid port range 0 - 65535"
  }
}

variable "int_port" {
  type = number
  default = 1880

  validation {
      condition = var.int_port == 1880
      error_message = "The internal port must be 1880"
  }
  
}

variable "cont_count" {
  type = number
  default = 1
}

locals {
  container_count = length(var.ext_port[terraform.workspace])
}


