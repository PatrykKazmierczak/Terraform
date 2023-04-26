resource "random_string" "random" {
  count = var.count_in
  length = 6
  special = false
  upper = false
}

resource "docker_container" "app_container" {
  count = var.count_in
  name  = join("-",[var.name_in, terraform.workspace, random_string.random[count.index].result])
  image = var.image_in
  command = ["sleep", "infinity"]
  ports {
    internal = var.int_port_in
    external = var.ext_port_in[count.index]
  }
  volumes {
    container_path = var.container_path_in
    volume_name = docker_volume.container_volume[count.index].name
  }
}

resource "docker_volume" "container_volume" {
  count = var.count_in
  name = "${var.name_in}-${random_string.random[count.index].result}-volume"
  lifecycle {
    prevent_destroy = false
  }
<<<<<<< HEAD
  provisioner "local-exec" {
    when = destroy
    command = "mkdir C:\\Terraform\\Terraform-docker\\backup"
    on_failure = continue
  }
  # provisioner "local-exec" {
  #   when = destroy
  #   command = "mkdir C:\\Terraform\\Terraform-docker\\backup"
  # }
=======

#   provisioner "local-exec" {
#   when = destroy
#   command = "mkdir C:\\Terraform\\backup"
#   on_failure = continue
#   }

#   provisioner "local-exec" {
#   when = destroy
#   command = "powershell Compress-Archive -Path '${self.mountpoint}\\*' -DestinationPath 'C:\\Terraform\\backup\\${self.name}\\${self.name}.zip'"
#   on_failure = fail
# }
>>>>>>> fef43f3ba83162e5ead41c22e43ce5137457a66a
}