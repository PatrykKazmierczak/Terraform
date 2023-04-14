resource "docker_image" "ubuntu_image" {
  name  = "ubuntu:latest"
  command = ["sleep", "infinity"]
 
}