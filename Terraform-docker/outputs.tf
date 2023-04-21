# output "ip-address" {
#   value = join("\n ",  flatten([docker_container.nodered_container[*].name, 
#                                 docker_container.nodered_container[*].network_data[*].ip_address,
#                                 docker_container.nodered_container[*].ports[*].external]))
#   description = "The IP address and external port of the container"
# }

# output "ip-address-and-ports-nodered" {
#   value = [for i in docker_container.nodered_container[*]: join(":",i.network_data[*]["ip_address"], i.ports[*]["external"], i.name[*])]
#   description = "The IP address and external port of the container"
#   # sensitive = true
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