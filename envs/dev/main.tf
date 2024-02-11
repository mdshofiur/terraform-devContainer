terraform {
  cloud {
    organization = "shofiurbd13"

    workspaces {
      name = "blueprint"
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

module "dev_infra" {
  source = "../../blueprint"
  name     = "master-vpc"
  vpc_cidr = "10.0"
}