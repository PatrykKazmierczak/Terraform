
module "nodered_image" {
  source = "./image"
  image_in = var.image["nodered"][terraform.workspace]
}

module "ubuntu_image" {
  source = "./image"
  image_in = var.image["ubuntu"][terraform.workspace]
}

module "grafana_image" {
  source = "./image"
  image_in = var.image["grafana"][terraform.workspace]
}

module "jenkins_image" {
  source = "./image"
  image_in = var.image["jenkins"][terraform.workspace]
}

module "postgres_image" {
  source = "./image"
  image_in = var.image["postgres"][terraform.workspace]
}

module "debian_image" {
  source = "./image"
  image_in = var.image["debian"][terraform.workspace]
}



resource "random_string" "random_1" {
  length = local.container_count
  special = false
  upper = false
}

# ------------------------------------------------------------Terraform-Docker-Container----------------------------------------------------------------

module "container" {
  source = "./container"
  count = local.container_count
  name_in  = join("-",["nodered_container", terraform.workspace, random_string.random_1.result])
  image_in = module.nodered_image.image_out
  int_port_in= var.int_port
  ext_port_in = var.ext_port[terraform.workspace][count.index]
  container_path_in = "/data"
}

# module "container" {
#   source = "./container"
#   count = local.container_count
#   name_in  = join("-",["ubuntu_container", terraform.workspace, random_string.random_1.result])
#   image_in = module.ubuntu_image.image_out
#   int_port_in= var.int_port
#   ext_port_in = var.ext_port[terraform.workspace][count.index]
#   container_path_in = "/data"
# }

# module "container" {
#   source = "./container"
#   count = local.container_count
#   name_in  = join("-",["grafana_container", terraform.workspace, random_string.random_1.result])
#   image_in = module.grafana_image.image_out
#   int_port_in= var.int_port
#   ext_port_in = var.ext_port[terraform.workspace][count.index]
#   container_path_in = "/data"
# }

# resource "docker_container" "debian_container" {
#   count = local.container_count
#   name  = join("-",["debian-container", terraform.workspace, random_string.random_3.result])
#   image = module.image.image_out_3
#   command = ["sleep", "infinity"]
#   ports {
#     internal = var.int_port
#     # external = var.ext_port[terraform.workspace][count.index]
#   }
#   volumes {
#     container_path = "/data"
#     host_path = "${path.cwd}/debianvol"
#   }
# }


# resource "docker_container" "postgresql_container" {
#   count = local.container_count
#   name  = join("-",["postgresql-container", terraform.workspace, random_string.random_4.result])
#   image = module.image.image_out_4
#   command = ["sleep", "infinity"]
#   ports {
#     internal = var.int_port
#     # external = var.ext_port[terraform.workspace][count.index]
#   }
#   volumes {
#     container_path = "/data"
#     host_path = "${path.cwd}/postgresqlvol"
#   }
# }

# resource "docker_container" "jenkins_container" {
#   count = local.container_count
#   name  = join("-",["jenkins-container", terraform.workspace, random_string.random_5.result])
#   image = module.image.image_out_5
#   command = ["sleep", "infinity"]
#   ports {
#     internal = var.int_port
#     # external = var.ext_port[terraform.workspace][count.index]
#   }
#   volumes {
#     container_path = "/data"
#     host_path = "${path.cwd}/jenkinsvol"
#   }
# }










  

