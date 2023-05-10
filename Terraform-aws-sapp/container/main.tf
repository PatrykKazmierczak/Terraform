resource "random_string" "random" {
  count   = var.count_in
  length  = 6
  special = false
  upper   = false
}

resource "docker_container" "app_container" {
  count = var.count_in
  name  = "${var.name_in}-${terraform.workspace}-${ random_string.random[count.index].result}"
  image = var.image_in
  gpus = 2
  memory = 400 
  ports {
    internal = var.int_port_in
    external = var.ext_port_in[count.index]
  }

  dynamic "volumes" {
    for_each = var.volumes_in
    content {
    container_path = volumes.value["container_path_each"]
    # volume_name    = module.volume[count.index].volume.output[volume.key]
    }
  }
}
  # module "volume" {
  #   source = "./volume"
  #   count = var.count_in
  #   # volume_count = length(var.volumes_in)
  #   # volume_name = "${var.name_in}-${terraform.workspace}-${random_string.random[count.index].result}-volume"
  # }
  