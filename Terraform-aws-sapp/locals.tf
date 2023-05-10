locals {
  deployment = {
     ubuntu = {
      container_count = length(var.ext_port["ubuntu"][terraform.workspace])
      image = var.image["ubuntu"][terraform.workspace]
      int = 7070
      ext = var.ext_port["ubuntu"][terraform.workspace]
      volumes = [
        {container_path_each = "/var/lib/ubuntu"},
        {container_path_each = "/etc/ubuntu"}
      ]
    }
  }
}