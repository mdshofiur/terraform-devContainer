# resource "aws_route_table" "public_table" {
#   vpc_id = var.public_route_table_tags["vpc_id"]
#   tags = {
#     Name = var.public_route_table_tags["name"]
#   }
# }

# resource "aws_route" "public_route" {
#   route_table_id         = var.public_route["route_table_id"]
#   destination_cidr_block = var.public_route["cidr_block"]
#   gateway_id             = var.public_route["gateway_id"]
# }

# resource "aws_route" "public_route" {
#   count                  = length(var.public_route["route_table_ids"])
#   route_table_id         = var.public_route["route_table_ids"]
#   destination_cidr_block = var.public_route["cidr_block"]
#   gateway_id             = var.public_route["gateway_id"]
# }

# resource "aws_route" "public_route" {
#   count                  = length(var.public_route)
#   route_table_id         = var.public_route[count.index]["route_table_ids"]
#   destination_cidr_block = var.public_route[count.index]["cidr_block"]
#   gateway_id             = var.public_route[count.index]["gateway_id"]
# }


# resource "aws_route_table_association" "public_subnet_association" {
#   subnet_id      = var.public_route_table_association["subnet_id"]
#   route_table_id = var.public_route_table_association["route_table_id"]
# }


# module "route_table" {
#   source = "./modules/route_table"

#   public_route_table_tags = {
#     name   = "public-route-table"
#     vpc_id = module.vpc.aws_vpc_id
#   }

#   public_route = {
#     route_table_id = module.route_table.public_route_table_id
#     cidr_block     = "0.0.0.0/0"
#     gateway_id     = module.vpc.internet_gateway_id
#   }

#   public_route_table_association = {
#     subnet_id      = module.subnet.aws_subnet_public_id
#     route_table_id = module.route_table.public_route_table_id
#   }


# }
