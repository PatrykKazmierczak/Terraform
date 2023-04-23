
locals {
  deployment = {
    nodered = {
      
      container_count = length(var.ext_port["nodered"][terraform.workspace])
      image = var.image["nodered"][terraform.workspace]
      int = 1881
      ext = var.ext_port["nodered"][terraform.workspace]
      container_path = "/data"
    }
    ubuntu = {
      container_count = length(var.ext_port["ubuntu"][terraform.workspace])
      image = var.image["ubuntu"][terraform.workspace]
      int = 3501
      ext = var.ext_port["ubuntu"][terraform.workspace]
      container_path = "/data"
    }
    grafana = {
      container_count = length(var.ext_port["grafana"][terraform.workspace])
      image = var.image["grafana"][terraform.workspace]
      int = 1981
      ext = var.ext_port["grafana"][terraform.workspace]
      container_path = "/data"
    }
  }
}


module "image" {
  source = "./image"
  for_each = local.deployment
  image_in = each.value.image
}




# ------------------------------------------------------------Terraform-Docker-Container----------------------------------------------------------------

module "container" {
  source = "./container"
  count_in = each.value.container_count
  for_each = local.deployment
  name_in  = each.key
  image_in = module.image[each.key].image_out
  int_port_in= each.value.int
  ext_port_in = each.value.ext
  container_path_in = each.value.container_path
}










  

