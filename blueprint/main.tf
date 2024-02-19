

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
    for detail in var.frontend_sg_details : {
      name           = detail.name
      vpc_attachment = detail.vpc_attachment
      frontend_rules = zipmap(["frontend_ingress", "frontend_egress"], [
        detail.frontend_ingress,
        detail.frontend_egress
      ])
    }
  ]
}


module "security_group_list" {
  source = "../modules/security_group"

  frontend_sg = [
    for detail in var.frontend_sg_details : {
      name           = detail.name
      vpc_attachment = detail.vpc_attachment
      frontend_ingress = [
        for ingress in detail.frontend_ingress : merge(ingress, { type = "ingress" })
      ]
      frontend_egress = [
        for egress in detail.frontend_egress : merge(egress, { type = "egress" })
      ]
    }
  ]
}



module "security_group_list" {
  source = "../modules/security_group"

  frontend_sg = [
    for detail in var.frontend_sg_details : {
      name           = detail.name
      vpc_attachment = detail.vpc_attachment
      frontend_ingress = flatten([
        for ingress in detail.frontend_ingress : {
          from_port   = ingress.from_port
          to_port     = ingress.to_port
          protocol    = ingress.protocol
          cidr_blocks = ingress.cidr_blocks
          description = ingress.description
        }
      ])
      frontend_egress = flatten([
        for egress in detail.frontend_egress : {
          from_port   = egress.from_port
          to_port     = egress.to_port
          protocol    = egress.protocol
          cidr_blocks = egress.cidr_blocks
          description = egress.description
        }
      ])
    }
  ]
}




module "security_group_list" {
  source = "../modules/security_group"
  frontend_sg = [
    {
      name           = var.frontend_sg_details[0].name
      vpc_attachment = var.frontend_sg_details[0].vpc_attachment
      frontend_ingress = [
        {
          from_port   = var.frontend_sg_details[0].frontend_ingress[0].from_port
          to_port     = var.frontend_sg_details[0].frontend_ingress[0].to_port
          protocol    = var.frontend_sg_details[0].frontend_ingress[0].protocol
          cidr_blocks = var.frontend_sg_details[0].frontend_ingress[0].cidr_blocks
          description = var.frontend_sg_details[0].frontend_ingress[0].description
        }
      ]
      frontend_egress = [
        {
          from_port   = var.frontend_sg_details[0].frontend_egress[0].from_port
          to_port     = var.frontend_sg_details[0].frontend_egress[0].to_port
          protocol    = var.frontend_sg_details[0].frontend_egress[0].protocol
          cidr_blocks = var.frontend_sg_details[0].frontend_egress[0].cidr_blocks
          description = var.frontend_sg_details[0].frontend_egress[0].description
        }
      ]
    }
  ]
}



