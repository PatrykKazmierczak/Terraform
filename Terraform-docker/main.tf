

# -------------------------------------------------------------Terraform-Docker----------------------------------------------------------------



# resource "null_resource" "dockervol_1" {
#   provisioner "local-exec" {
#     command = "if not exist noderedvol (mkdir noderedvol)"
#   }
# }

# resource "null_resource" "dockervol_2" {
#   provisioner "local-exec" {
#     command = "if not exist noderedvol (mkdir ubuntuvol)"
#   }
# }

# resource "null_resource" "dockervol_3" {
#   provisioner "local-exec" {
#     command = "if not exist noderedvol (mkdir debianvol)"
#   }
# }

# resource "null_resource" "dockervol_4" {
#   provisioner "local-exec" {
#     command = "if not exist noderedvol (mkdir postgresqlvol)"
#   }
# }

# resource "null_resource" "dockervol_5" {
#   provisioner "local-exec" {
#     command = "if not exist noderedvol (mkdir jenkinsvol)"
#   }
# }

# -------------------------------------------------------------Terraform-Docker-Module----------------------------------------------------------------

module "image" {
  source = "./image"
  image_in = var.image[terraform.workspace]
}

# -------------------------------------------------------------Terraform-Random-String----------------------------------------------------------------


resource "random_string" "random_1" {
  length = local.container_count
  special = false
  upper = false
}

# resource "random_string" "random_2" {
#   length = 6
#   special = false
#   upper = false
# }

# resource "random_string" "random_3" {
#   length = 6
#   special = false
#   upper = false
# }

# resource "random_string" "random_4" {
#   length = 6
#   special = false
#   upper = false
# }

# resource "random_string" "random_5" {
#   length = 6
#   special = false
#   upper = false
# }

# ------------------------------------------------------------Terraform-Docker-Container----------------------------------------------------------------

module "container" {
  source = "./container"
  count = local.container_count
  name_in  = join("-",["nodered-container", terraform.workspace, random_string.random_1.result])
  image_in = module.image.image_out
  int_port_in= var.int_port
  ext_port_in = var.ext_port[terraform.workspace][count.index]
  container_path_in = "/data"
  host_path_in = "${path.cwd}/noderedvol"
}

# resource "docker_container" "ubuntu_container" {
#   count = local.container_count
#   name  = join("-",["ubuntu-container", terraform.workspace, random_string.random_2.result])
#   image = module.image.image_out_2
#   command = ["sleep", "infinity"]
#   ports {
#     internal = var.int_port
#     # external = var.ext_port[terraform.workspace][count.index]
#   }
#   volumes {
#     container_path = "/data"
#     host_path = "${path.cwd}/ubuntuvol"
#   }
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










  

