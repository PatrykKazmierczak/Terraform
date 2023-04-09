terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 4.61.0"
        }
    }
}
provider "aws" {
    region = "eu-central-1"
}

resource "aws_instance" "example" {
    ami = "ami-00ad2436e75246bba"
    instance_type = "t2.micro"
    count = 2
}