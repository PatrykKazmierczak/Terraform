


#-------------------------------------------------------------Terraform-AWS----------------------------------------------------------------


resource "aws_s3_bucket" "aws_s3_bucket_1" {
  bucket = "aws-s3-bucket-pkaz-devops-1"

  tags = {
    Name        = "My bucket-1"
    Environment = "Dev"
  }

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket" "aws_s3_bucket_2" {
  bucket = "aws-s3-bucket-pkaz-devops-2"

  tags = {
    Name        = "My bucket-2"
    Environment = "Dev"
  }

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket" "aws_s3_bucket_3" {
  bucket = "aws-s3-bucket-pkaz-devops-3"

  tags = {
    Name        = "My bucket-3"
    Environment = "Dev"
  }

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_policy" "aws_s3_bucket_policy_1" {
  bucket = aws_s3_bucket.aws_s3_bucket_1.id

  policy = jsonencode({
    "Id": "Policy1681656626372",
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "Stmt1681656625569",
        "Action": [
          "s3:GetObject"
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:s3:::aws-s3-bucket-pkaz-devops-1/*",
        "Principal": "*"
      }
    ]
  })
}


resource "aws_s3_bucket_policy" "aws_s3_bucket_policy_2" {
  bucket = aws_s3_bucket.aws_s3_bucket_2.id

  policy = jsonencode({
    "Id": "Policy1681656626372",
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "Stmt1681656625569",
        "Action": [
          "s3:GetObject"
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:s3:::aws-s3-bucket-pkaz-devops-2/*",
        "Principal": "*"
      }
    ]
  })
}

resource "aws_s3_bucket_policy" "aws_s3_bucket_policy_3" {
  bucket = aws_s3_bucket.aws_s3_bucket_3.id

  policy = jsonencode({
    "Id": "Policy1681656626372",
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "Stmt1681656625569",
        "Action": [
          "s3:GetObject"
        ],
        "Effect": "Allow",
        "Resource": "arn:aws:s3:::aws-s3-bucket-pkaz-devops-3/*",
        "Principal": "*"
      }
    ]
  })
}

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

#-------------------------------------------------------------Terraform-Docker-Module----------------------------------------------------------------

# module "image" {
#   source = "./image"
#   image_in = var.image[terraform.workspace]
# }

#-------------------------------------------------------------Terraform-Random-String----------------------------------------------------------------


# resource "random_string" "random_1" {
#   length = local.container_count
#   special = false
#   upper = false
# }

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

#------------------------------------------------------------Terraform-Docker-Container----------------------------------------------------------------

# resource "docker_container" "nodered_container" {
#   count = local.container_count
#   name  = join("-",["nodered-container", terraform.workspace, random_string.random_1.result])
#   image = module.image.image_out
#   command = ["sleep", "infinity"]
#   ports {
#     internal = var.int_port
#     external = var.ext_port[terraform.workspace][count.index]
#   }
#   volumes {
#     container_path = "/data"
#     host_path = "${path.cwd}/noderedvol"
#   }
# }

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










  

