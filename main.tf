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


# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"
#   tags = {
#     Name = "main"
#   }
# }


# module "vpc_module" {
#   source = "./vpc"
#   vpc_cidr = "10.0.0.0/16"
#   Name = "main"
# }



module "vpc" {
  source = "./vpc"

  vpc_name = "my-vpc"

  vpc_cidr_block = "10.0.0.0/16"


  subnet_configs = [
    {
      name : "public-subnet",
      cidr_block        = "10.0.1.0/24"
      availability_zone = "us-east-1a"
      allow_public_ip   = true
    },
    {
      name : "private-subnet",
      cidr_block        = "10.0.2.0/24"
      availability_zone = "us-east-1a"
      allow_public_ip   = false
    }
  ]

  route_table_variable = [
    {
      name        = "router_table_1"
      subnet_name = "public_subnet"
      routes : [
        {
          cidr_block = "0.0.0.0/0"
          gateway_id = module.vpc.internet_gateway_id
        },
        {
          cidr_block = "10.0.2.0/24"
          gateway_id = "local"
        },
      ]
    },
  ]



}





