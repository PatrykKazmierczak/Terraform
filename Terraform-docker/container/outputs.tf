# output "container-name" {
#     value = module.container[*].container
#     description = "The name of the container"
  
# }

# output "ip-address" {
#     value = flatten(module.container[*].ip-address)
#     description = "The IP address and external port fo the container"
# }

output "application_access" {
    value = {for x in docker_container.app_container[*]: x.name => join(":", x.network_data[*]["ip_address"], x.ports[*]["external"])}
}
