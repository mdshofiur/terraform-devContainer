

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
locals {
  public_subnet_configs = [
    for detail in var.public_subnet_variables : {
      name              = detail.public_subnet_name
      cidr_block        = detail.public_subnet_cidr_block
      availability_zone = detail.public_subnet_availability_zone
      allow_public_ip   = detail.public_subnet_allow_public_ip
      vpc_id            = detail.vpc_id
      vpc_name          = detail.vpc_name
    }

  ]

  aws_route_table_public = [
    for detail in var.aws_route_table_for_public_subnets : {
      route_table_name = detail.route_table_name
      vpc_id           = detail.vpc_id
      routes           = detail.routes
    }
  ]

  private_subnet_configs = [
    for detail in var.private_subnet_variables : {
      name              = detail.private_subnet_name
      cidr_block        = detail.private_subnet_cidr_block
      availability_zone = detail.private_subnet_availability_zone
      vpc_id            = detail.vpc_id
      vpc_name          = detail.vpc_name
    }
  ]

  aws_route_table_private = [
    for detail in var.aws_route_table_for_private_subnets : {
      route_table_name = detail.route_table_name
      vpc_id           = detail.vpc_id
      routes           = detail.routes
    }
  ]
}


module "public_subnet_details" {
  source = "../modules/subnet"

  /* -------------------------------------------------------------------------- */
  /*                        Public subnet configurations                        */
  /* -------------------------------------------------------------------------- */

  public_subnet_configs = local.public_subnet_configs

  aws_route_table_public = local.aws_route_table_public


  /* -------------------------------------------------------------------------- */
  /*                        Private subnet configurations                       */
  /* -------------------------------------------------------------------------- */

  private_subnet_configs = local.private_subnet_configs

  aws_route_table_private = local.aws_route_table_private

}


/* -------------------------------------------------------------------------- */
/*                          Module For Security Group                         */
/* -------------------------------------------------------------------------- */

locals {
  sg_details = [
    for detail in var.sg_details : {
      name              = detail.sg_name
      vpc_attachment    = detail.vpc_attachment_with_id
      dev_ingress_rules = detail.ingress_rules
      dev_egress_rules  = detail.egress_rules
    }
  ]
}

module "security_group_list" {
  source         = "../modules/security_group"
  security_group = local.sg_details
}


/* -------------------------------------------------------------------------- */
/*                               Module For Key Pair                           */
/* -------------------------------------------------------------------------- */

module "key_pair" {
  source        = "../modules/key-pair"
  key_pair_name = var.key_pair_name_for_access
  # public_key_path = var.public_key_path_dir
}

/* -------------------------------------------------------------------------- */
/*                               Module For EC2                               */
/* -------------------------------------------------------------------------- */

module "ec2_instance" {
  source = "../modules/ec2"

  count = length(var.ec2_instance)

  ec2 = [
    {
      instance_type              = var.ec2_instance[count.index].instance_type
      instance_name              = var.ec2_instance[count.index].instance_name
      instance_allow_public_ip   = var.ec2_instance[count.index].instance_allow_public_ip
      instance_key_name          = var.ec2_instance[count.index].instance_key_name
      instance_security_group_id = var.ec2_instance[count.index].instance_security_group_id
      instance_subnet_id         = var.ec2_instance[count.index].instance_subnet_id
    }
  ]
}




