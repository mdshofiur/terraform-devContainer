module "my_vpc" {
  source        = "../modules/vpc"
  vpc_name      = var.name
  vpc_cidr_base = var.vpc_cidr
}



# module "subnet" {
#   source = "./modules/subnet"
#   public_subnet_configs = [
#     {
#       name : "public-accessible",
#       cidr_block        = "10.0.1.0/24"
#       availability_zone = "us-east-1a"
#       allow_public_ip   = true
#       vpc_id            = module.vpc.aws_vpc_id
#       vpc_name          = module.vpc.vpc_name
#     }
#   ]

#   private_subnet_configs = [
#     {
#       name : "private-accessible",
#       cidr_block        = "10.0.3.0/24"
#       availability_zone = "us-east-1a"
#       allow_public_ip   = false
#       vpc_id            = module.vpc.aws_vpc_id
#       vpc_name          = module.vpc.vpc_name
#     }
#   ]


#   public_aws_route = {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = module.vpc.internet_gateway_id
#   }
# }
