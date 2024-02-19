

/* -------------------------------------------------------------------------- */
/*                               Module For VPC                               */
/* -------------------------------------------------------------------------- */

module "my_vpc" {
  source        = "../modules/vpc"
  vpc_name      = var.name
  vpc_cidr_base = var.vpc_cidr
  tags = {
    "Terraform"   = "true"
    "Environment" = "dev"
  }
}

/* -------------------------------------------------------------------------- */
/*                               Module For Subnet                            */
/* -------------------------------------------------------------------------- */
module "public_subnet_details" {
  source = "../modules/subnet"

  /* -------------------------------------------------------------------------- */
  /*                        Public subnet configurations                        */
  /* -------------------------------------------------------------------------- */

  //  Public subnet configurations
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

  // Route table for public subnets
  aws_route_table_public = [
    {
      route_table_name = var.aws_route_table_for_public_subnets[0].public_route_table_name
      vpc_id           = var.aws_route_table_for_public_subnets[0].public_vpc_id
      routes           = var.aws_route_table_for_public_subnets[0].public_routes
    }
  ]


  /* -------------------------------------------------------------------------- */
  /*                        Private subnet configurations                       */
  /* -------------------------------------------------------------------------- */

  // Private subnet configurations
  private_subnet_configs = [
    {
      name              = var.private_subnet_variables[0].private_subnet_name
      cidr_block        = var.private_subnet_variables[0].private_subnet_cidr_block
      availability_zone = var.private_subnet_variables[0].private_subnet_availability_zone
      vpc_id            = var.private_subnet_variables[0].vpc_id
      vpc_name          = var.private_subnet_variables[0].vpc_name
    }
  ]

  // Route table for private subnets
  aws_route_table_private = [
    {
      route_table_name = var.aws_route_table_for_private_subnets[0].private_route_table_name
      vpc_id           = var.aws_route_table_for_private_subnets[0].private_vpc_id
      routes           = var.aws_route_table_for_private_subnets[0].private_routes
    }
  ]

}


/* -------------------------------------------------------------------------- */
/*                          Module For Security Group                         */
/* -------------------------------------------------------------------------- */



module "security_group_list" {
  source = "../modules/security_group"

  frontend_sg = [
    for detail in var.frontend_sg_details : { name = detail.sg_name
      vpc_attachment                               = detail.vpc_attachment_with_id
      frontend_ingress                             = detail.frontend_ingress_rules
      frontend_egress                              = detail.frontend_egress_rules
    }
  ]
}





