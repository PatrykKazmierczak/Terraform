
locals {
  deployment = {
    nodered = {    
      container_count = length(var.ext_port["nodered"][terraform.workspace])
      image = var.image["nodered"][terraform.workspace]
      int = 1880
      ext = var.ext_port["nodered"][terraform.workspace]
      volumes = [
        {container_path_each = "/var/lib/nodered"},
        {container_path_each = "/etc/nodered"}
      ]
    }
    # ubuntu = {
    #   container_count = length(var.ext_port["ubuntu"][terraform.workspace])
    #   image = var.image["ubuntu"][terraform.workspace]
    #   int = 7070
    #   ext = var.ext_port["ubuntu"][terraform.workspace]
    #   volumes = [
      #   {container_path_each = "/var/lib/ubuntu"},
      #   {container_path_each = "/etc/ubuntu"}
      # ]
    # }
    
    grafana = {
      container_count = length(var.ext_port["grafana"][terraform.workspace])
      image = var.image["grafana"][terraform.workspace]
      int = 3000
      ext = var.ext_port["grafana"][terraform.workspace]
      volumes = [
        {container_path_each = "/var/lib/grafana"},
        {container_path_each = "/etc/grafana"}
      ]
    }
    prometheus = {
      container_count = length(var.ext_port["prometheus"][terraform.workspace])
      image = var.image["prometheus"][terraform.workspace]
      int = 9090
      ext = var.ext_port["prometheus"][terraform.workspace]
      volumes = [
        {container_path_each = "/var/lib/prometheus"},
        {container_path_each = "/etc/prometheus"}
      ]
    }

    # prometheus_windows_exporter = {
    #   container_count = length(var.ext_port["prometheus_windows_exporter"][terraform.workspace])
    #   image = var.image["prometheus_windows_exporter"][terraform.workspace]
    #   int = 9182
    #   ext = var.ext_port["prometheus_windows_exporter"][terraform.workspace]
    #   volumes = [
      #   {container_path_each = "/var/lib/prometheus_windows_exporter"},
      #   {container_path_each = "/etc/prometheus_windows_exporter"}
      # ]
    # }

    # debian = {
    #   container_count = length(var.ext_port["debian"][terraform.workspace])
    #   image = var.image["debian"][terraform.workspace]
    #   int = 4050
    #   ext = var.ext_port["debian"][terraform.workspace]
    #   volumes = [
      #   {container_path_each = "/var/lib/debian"},
      #   {container_path_each = "/etc/debian"}
      # ]
    # }
  }
}