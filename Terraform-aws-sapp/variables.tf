
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
  } 
}
variable "ext_port" {
  type = map(any)
}
  

variable "cont_count" {
  type = number
  default = 1
}
  

