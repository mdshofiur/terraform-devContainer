terraform {
  cloud {
    organization = "shofiurbd13"

    workspaces {
      name = "aws-automation"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.32.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "main"
  }
}


module "vpc_module" {
  source = "./vpc"
  vpc_cidr = "10.0.0.0/16"
  Name = "main"
}