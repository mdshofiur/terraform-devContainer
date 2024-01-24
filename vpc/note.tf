# locals {
#   subnet_index = var.subnet_configs
# }


# resource "aws_subnet" "subnet" {
#   count                   = length(local.subnet_index)
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = local.subnet_index[count.index]["cidr_block"]
#   availability_zone       = local.subnet_index[count.index]["availability_zone"]
#   map_public_ip_on_launch = local.subnet_index[count.index]["allow_public_ip"]

#   tags = {
#     Name = "${var.vpc_name}-${local.subnet_index[count.index]["name"]}-${count.index + 1}"
#   }
# }




# module "example_module" {
#   source               = "./example_module"
#   route_table_configs = local.example_route_table_configs
# }


# locals {
#   example_route_table_configs = [
#     {
#       name        = "route-table-1"
#       subnet_name = "subnet-1"
#       routes      = [
#         { cidr_block = "0.0.0.0/0", gateway_id = "igw-1234567890abcdef0" },
#         { cidr_block = "10.1.0.0/24", gateway_id = "local" },
#       ]
#     },
#     {
#       name        = "route-table-2"
#       subnet_name = "subnet-2"
#       routes      = [
#         { cidr_block = "0.0.0.0/0", gateway_id = "vgw-9876543210abcdef0" },
#         { cidr_block = "10.2.0.0/24", gateway_id = "local" },
#       ]
#     },
#   ]
# }


