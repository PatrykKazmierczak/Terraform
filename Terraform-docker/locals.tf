
locals {
  deployment = {
    nodered = {    
      container_count = length(var.ext_port["nodered"][terraform.workspace])
      image = var.image["nodered"][terraform.workspace]
      int = 1880
      ext = var.ext_port["nodered"][terraform.workspace]
      volumes = [
        {container_path_each = "/data"}
      ]
    }
    # ubuntu = {
    #   container_count = length(var.ext_port["ubuntu"][terraform.workspace])
    #   image = var.image["ubuntu"][terraform.workspace]
    #   int = 7070
    #   ext = var.ext_port["ubuntu"][terraform.workspace]
    #   container_path = "/data"
    # }
    grafana = {
      container_count = length(var.ext_port["grafana"][terraform.workspace])
      image = var.image["grafana"][terraform.workspace]
      int = 3000
      ext = var.ext_port["grafana"][terraform.workspace]
      volumes = [
        {container_path_each = "/data"}
      ]
    }
    prometheus = {
      container_count = length(var.ext_port["prometheus"][terraform.workspace])
      image = var.image["prometheus"][terraform.workspace]
      int = 9090
      ext = var.ext_port["prometheus"][terraform.workspace]
      volumes = [
        {container_path_each = "/data"}
      ]
    }

    # prometheus_windows_exporter = {
    #   container_count = length(var.ext_port["prometheus_windows_exporter"][terraform.workspace])
    #   image = var.image["prometheus_windows_exporter"][terraform.workspace]
    #   int = 9182
    #   ext = var.ext_port["prometheus_windows_exporter"][terraform.workspace]
    #   volumes = [
    #     {container_path_each = "C:/Program Files/Prometheus/exporters"},{container_path_each = "C:/Program Files/Prometheus/data"}  
    #   ]  
    # }

    # debian = {
    #   container_count = length(var.ext_port["debian"][terraform.workspace])
    #   image = var.image["debian"][terraform.workspace]
    #   int = 4050
    #   ext = var.ext_port["debian"][terraform.workspace]
    #   container_path = "/data"
    # }
  }
}