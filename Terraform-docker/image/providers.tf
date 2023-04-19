terraform {
  required_providers {
    # docker = {
    #   source  = "kreuzwerker/docker"
    #   version = "3.0.2"
    # }
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.63.0"
    }
  }
}


# provider docker {
  
# }


provider "aws" {
  region = "eu-central-1"
}