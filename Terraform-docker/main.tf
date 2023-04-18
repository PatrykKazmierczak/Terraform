


#-------------------------------------------------------------Terraform-AWS----------------------------------------------------------------
# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~>4.63.0"
#     }
#   }
# }

# provider "aws" {
#   region = "eu-central-1"
  
# }

# resource "aws_s3_bucket" "aws_s3_bucket_1" {
#   bucket = "aws-s3-bucket-pkaz-devops-1"

#   tags = {
#     Name        = "My bucket-1"
#     Environment = "Dev"
#   }

#   versioning {
#     enabled = true
#   }

#   lifecycle {
#     prevent_destroy = true
#   }
# }

# resource "aws_s3_bucket" "aws_s3_bucket_2" {
#   bucket = "aws-s3-bucket-pkaz-devops-2"

#   tags = {
#     Name        = "My bucket-2"
#     Environment = "Dev"
#   }

#   versioning {
#     enabled = true
#   }

#   lifecycle {
#     prevent_destroy = true
#   }
# }

# resource "aws_s3_bucket" "aws_s3_bucket_3" {
#   bucket = "aws-s3-bucket-pkaz-devops-3"

#   tags = {
#     Name        = "My bucket-3"
#     Environment = "Dev"
#   }

#   versioning {
#     enabled = true
#   }

#   lifecycle {
#     prevent_destroy = true
#   }
# }

# resource "aws_s3_bucket_policy" "aws_s3_bucket_policy_1" {
#   bucket = aws_s3_bucket.aws_s3_bucket_1.id

#   policy = jsonencode({
#     "Id": "Policy1681656626372",
#     "Version": "2012-10-17",
#     "Statement": [
#       {
#         "Sid": "Stmt1681656625569",
#         "Action": [
#           "s3:GetObject"
#         ],
#         "Effect": "Allow",
#         "Resource": "arn:aws:s3:::aws-s3-bucket-pkaz-devops-1/*",
#         "Principal": "*"
#       }
#     ]
#   })
# }


# resource "aws_s3_bucket_policy" "aws_s3_bucket_policy_2" {
#   bucket = aws_s3_bucket.aws_s3_bucket_2.id

#   policy = jsonencode({
#     "Id": "Policy1681656626372",
#     "Version": "2012-10-17",
#     "Statement": [
#       {
#         "Sid": "Stmt1681656625569",
#         "Action": [
#           "s3:GetObject"
#         ],
#         "Effect": "Allow",
#         "Resource": "arn:aws:s3:::aws-s3-bucket-pkaz-devops-2/*",
#         "Principal": "*"
#       }
#     ]
#   })
# }

# resource "aws_s3_bucket_policy" "aws_s3_bucket_policy_3" {
#   bucket = aws_s3_bucket.aws_s3_bucket_3.id

#   policy = jsonencode({
#     "Id": "Policy1681656626372",
#     "Version": "2012-10-17",
#     "Statement": [
#       {
#         "Sid": "Stmt1681656625569",
#         "Action": [
#           "s3:GetObject"
#         ],
#         "Effect": "Allow",
#         "Resource": "arn:aws:s3:::aws-s3-bucket-pkaz-devops-3/*",
#         "Principal": "*"
#       }
#     ]
#   })
# }

# -------------------------------------------------------------Terraform-Docker----------------------------------------------------------------

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}


provider docker {
  #  registry_auth {
  #   username = var.docker_hub_username
  #   password = var.docker_hub_password
  #   address = "https://index.docker.io/v1/"
  # }
}

resource "null_resource" "dockervol_1" {
  provisioner "local-exec" {
    command = "if not exist noderedvol (mkdir noderedvol)"
  }
}

resource "null_resource" "dockervol_2" {
  provisioner "local-exec" {
    command = "if not exist noderedvol (mkdir ubuntuvol)"
  }
}

resource "null_resource" "dockervol_3" {
  provisioner "local-exec" {
    command = "if not exist noderedvol (mkdir debianvol)"
  }
}

resource "null_resource" "dockervol_4" {
  provisioner "local-exec" {
    command = "if not exist noderedvol (mkdir postgresqlvol)"
  }
}

resource "null_resource" "dockervol_5" {
  provisioner "local-exec" {
    command = "if not exist noderedvol (mkdir jenkinsvol)"
  }
}

#-------------------------------------------------------------Terraform-Docker-Images----------------------------------------------------------------

resource "docker_image" "nodered_image" {
  name = var.image_nodered[terraform.workspace]
}


resource "docker_image" "ubuntu_image" {
  name = var.image_ubuntu[terraform.workspace]
  
}

resource "docker_image" "debian_image" {
  name = var.image_debian[terraform.workspace]
  
}

resource "docker_image" "postgresql_image" {
  name = var.image_postgresql[terraform.workspace]
  
}

resource "docker_image" "jenkins_image" {
  name = var.image_jenkins[terraform.workspace]
  
}

#-------------------------------------------------------------Terraform-Random-String----------------------------------------------------------------


resource "random_string" "random" {
  length = 6
  special = false
  upper = false
}

# resource "random_string" "random_2" {
#   count = local.container_count
#   length = 7
#   special = false
#   upper = false
# }

#------------------------------------------------------------Terraform-Docker-Container----------------------------------------------------------------

resource "docker_container" "nodered_container" {
  count = local.container_count
  name  = join("-",["nodered-container", terraform.workspace, random_string.random.result])
  image = docker_image.nodered_image.name
  ports {
    internal = var.int_port
    # external = lookup(var.ext_port, terraform.workspace)[count.index]
  }
  volumes {
    container_path = "/data"
    host_path = "${path.cwd}/noderedvol"
  }
}

resource "docker_container" "ubuntu_container" {
  count = local.container_count
  name  = join("-",["ubuntu-container", terraform.workspace, random_string.random.result])
  image = docker_image.ubuntu_image.name
  command = ["sleep", "infinity"]
  ports {
    internal = var.int_port
    external = var.ext_port[terraform.workspace][count.index]
  }
  volumes {
    container_path = "/data"
    host_path = "${path.cwd}/ubuntuvol"
  }
}

resource "docker_container" "debian_container" {
  count = local.container_count
  name  = join("-",["debian-container", terraform.workspace, random_string.random.result])
  image = docker_image.debian_image.name
  command = ["sleep", "infinity"]
  ports {
    internal = var.int_port
    external = var.ext_port[terraform.workspace][count.index]
  }
  volumes {
    container_path = "/data"
    host_path = "${path.cwd}/debianvol"
  }
}


resource "docker_container" "postgresql_container" {
  count = local.container_count
  name  = join("-",["postgresql-container", terraform.workspace, random_string.random.result])
  image = docker_image.postgresql_image.name
  command = ["sleep", "infinity"]
  ports {
    internal = var.int_port
    external = var.ext_port[terraform.workspace][count.index]
  }
  volumes {
    container_path = "/data"
    host_path = "${path.cwd}/postgresqlvol"
  }
}

resource "docker_container" "jenkins_container" {
  count = local.container_count
  name  = join("-",["jenkins-container", terraform.workspace, random_string.random.result])
  image = docker_image.jenkins_image.name
  command = ["sleep", "infinity"]
  ports {
    internal = var.int_port
    external = var.ext_port[terraform.workspace][count.index]
  }
  volumes {
    container_path = "/data"
    host_path = "${path.cwd}/jenkinsvol"
  }
}

#------------------------------------------------------------Terrform-Import-Example----------------------------------------------------------------

# terraform import docker_container.ubuntu_container_2 $(docker inspect --format="{{.ID}}" ubuntu-container-37gjd6)

# resource "docker_container" "ubuntu_container_2" {
#   name = "ubuntu-container-37gjd6"
#   image = docker_image.ubuntu_image.name
  
# }









  

