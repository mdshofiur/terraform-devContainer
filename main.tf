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
  source         = "./modules/vpc"
  vpc_name       = "my-vpc"
  vpc_cidr_block = "10.0.0.0/16"
}


module "subnet" {
  source = "./modules/subnet"
  public_subnet_configs = [
    {
      name : "public-accessible",
      cidr_block        = "10.0.1.0/24"
      availability_zone = "us-east-1a"
      allow_public_ip   = true
      vpc_id            = module.vpc.aws_vpc_id
      vpc_name          = module.vpc.vpc_name
    }
  ]

  private_subnet_configs = [
    {
      name : "private-accessible",
      cidr_block        = "10.0.3.0/24"
      availability_zone = "us-east-1a"
      allow_public_ip   = false
      vpc_id            = module.vpc.aws_vpc_id
      vpc_name          = module.vpc.vpc_name
    }
  ]
}




module "route_table" {
  source = "./modules/route_table"

  public_route_table_tags = {
    name   = "public-route-table"
    vpc_id = module.vpc.aws_vpc_id
  }

  public_route = {
    route_table_id = module.route_table.public_route_table_id
    cidr_block     = "0.0.0.0/0"
    gateway_id     = module.vpc.internet_gateway_id
  }


  # public_route_table_association = {
  #   subnet_id      = module.subnet.aws_subnet_public_id
  #   route_table_id = module.route_table.public_route_table_id
  # }


}




