terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 4.61.0"
        }
    }
}
provider "aws" {
    region = var.region
}

resource "aws_instance" "example" {
    ami = "ami-00ad2436e75246bba"
    instance_type = var.ec2_instance_type
    count = var.number_of_instances
}

module "my_ec2_instance" {
  source = "./new_module"
}