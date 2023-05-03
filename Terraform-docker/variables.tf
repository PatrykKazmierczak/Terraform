
variable "image" {
  type = map
  description = "image for container"
  default = {
  nodered = {
    dev = "nodered/node-red"
    prod = "nodered/node-red"
  }
  ubuntu = {
    dev = "ubuntu:latest"
    prod = "ubuntu:latest-minimal"
  }
  grafana = {
    dev = "grafana/grafana"
    prod = "grafana/grafana"
  }
  postgres = {
    dev = "postgres:latest"
    prod = "postgres:latest-minimal"
  }
  debian = {
    dev = "debian:latest"
    prod = "debian:latest-minimal"
  }
  jenkins = {
    dev = "jenkins/jenkins:lts-jdk11"
    prod = "jenkins/jenkins:lts-jdk11-minimal"
  }
  prometheus = {
    dev = "prom/prometheus"
    prod = "prom/prometheus"
  }
  influxdb = {
    dev = "influxdb"
    prod = "influxdb"
  }
  portainer = {
    dev = "portainer/portainer"
    prod = "portainer/portainer"
  }
}
}
variable "ext_port" {
  type = map(any)
}

#   validation {
#       condition = max(var.ext_port["dev"]...) <= 65535 && min(var.ext_port["dev"]...) >= 1980
#       error_message = "Rhe external port must be in the valid port range 0 - 65535"
#   }
#   validation {
#       condition = max(var.ext_port["prod"]...) < 1980 && min(var.ext_port["prod"]...) >= 1880
#       error_message = "Rhe external port must be in the valid port range 0 - 65535"
#   }
# }

# variable "int_port" {
#   type = number
#   default = 1880

#   validation {
#       condition = var.int_port == 1880
#       error_message = "The internal port must be 1880"
#   }
  
# }

variable "cont_count" {
  type = number
  default = 1
}




