resource "docker_image" "nodered_image" {
  name = var.image_in
}


# resource "docker_image" "ubuntu_image" {
#   name = "ubuntu:latest"
  
# }

# resource "docker_image" "debian_image" {
#   name = "debian:latest"
  
# }

# resource "docker_image" "postgresql_image" {
#   name = "postgres:latest"
  
# }

# resource "docker_image" "jenkins_image" {
#   name = "jenkins/jenkins:lts-jdk11"
  
# }
