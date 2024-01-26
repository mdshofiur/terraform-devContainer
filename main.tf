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


  # route_table_variable = [
  #   {
  #     name        = "router_table_1"
  #     subnet_name = "public_subnet"
  #     routes : [
  #       {
  #         cidr_block = "0.0.0.0/0"
  #         gateway_id = module.vpc.internet_gateway_id
  #       },
  #       {
  #         cidr_block = "10.0.2.0/24"
  #         gateway_id = "local"
  #       },
  #     ]
  #   },
  # ]

 route_table_variable = [
    {
      name        = "route-table-1"
      subnet_name = "subnet-1"
      routes      = [
        { cidr_block = "10.1.0.0/24", gateway_id = "igw-12345678" },
        { cidr_block = "10.2.0.0/24", gateway_id = "igw-87654321" },
      ]
    },
    {
      name        = "route-table-2"
      subnet_name = "subnet-2"
      routes      = [
        { cidr_block = "10.3.0.0/24", gateway_id = "igw-12345678" },
        { cidr_block = "10.4.0.0/24", gateway_id = "igw-87654321" },
      ]
    },
  ]

  

}





