provider "aws" {
  region = "us-east-1"
}

module "dev_infra" {
  source   = "./blueprint"
  name     = "k3s_cluster"
  vpc_cidr = "10.0.0.0/16"

  public_subnet_variables = [{
    public_subnet_name              = "public_subnet_1"
    public_subnet_cidr_block        = "10.0.1.0/24"
    public_subnet_availability_zone = "us-east-1a"
    public_subnet_allow_public_ip   = true
    vpc_id                          = module.dev_infra.vpc_id_output
    vpc_name                        = module.dev_infra.vpc_name_output
  }]
}

