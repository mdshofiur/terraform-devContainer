module "my_vpc" {
  source        = "../modules/vpc"
  vpc_name      = var.name
  vpc_cidr_base = var.vpc_cidr
  tags = {
    "Terraform"   = "true"
    "Environment" = "dev"
  }
}

module "public_subnet_details" {
  source = "../modules/subnet"
  public_subnet_configs = [
    {
      name              = var.public_subnet_variables[0].public_subnet_name
      cidr_block        = var.public_subnet_variables[0].public_subnet_cidr_block
      availability_zone = var.public_subnet_variables[0].public_subnet_availability_zone
      allow_public_ip   = var.public_subnet_variables[0].public_subnet_allow_public_ip
      vpc_id            = var.public_subnet_variables[0].vpc_id
      vpc_name          = var.public_subnet_variables[0].vpc_name
    }
  ]


  aws_route_table_public = [
    {
      route_table_name = var.aws_route_table_for_public_subnets[0].route_table_name
      vpc_id           = var.aws_route_table_for_public_subnets[0].vpc_id
      routes           = var.aws_route_table_for_public_subnets[0].routes
    }
  ]


  # aws_route_table = [
  #   {
  #     route_table_name = "public_route_table_1",
  #     vpc_id           = aws_vpc.main.id,
  #     routes = [
  #       {
  #         cidr_block = "0.0.0.0/0",
  #         gateway_id = aws_internet_gateway.igw.id
  #       },
  #       {
  #         cidr_block = "10.0.1.0/24",
  #         gateway_id = aws_nat_gateway.nat.id
  #       }
  #     ]
  #   },
  #   {
  #     route_table_name = "public_route_table_2",
  #     vpc_id           = aws_vpc.another.id,
  #     routes = [
  #       {
  #         cidr_block = "0.0.0.0/0",
  #         gateway_id = aws_internet_gateway.another_igw.id
  #       }
  #     ]
  #   }
  # ]



}


