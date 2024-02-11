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
      name                     = var.public_subnet_variables[0].public_subnet_name
      cidr_block               = var.public_subnet_variables[0].public_subnet_cidr_block
      availability_zone        = var.public_subnet_variables[0].public_subnet_availability_zone
      allow_public_ip          = var.public_subnet_variables[0].public_subnet_allow_public_ip
      vpc_id                   = var.public_subnet_variables[0].vpc_id
      vpc_name                 = var.public_subnet_variables[0].vpc_name
    }
  ]
}


