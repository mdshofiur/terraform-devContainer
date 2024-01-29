# resource "aws_vpc" "main" {
#   cidr_block           = var.vpc_cidr_block
#   enable_dns_support   = true
#   enable_dns_hostnames = true

#   tags = {
#     Name = var.vpc_name
#   }
# }

# resource "aws_internet_gateway" "gw" {
#   tags = {
#     Name = "${var.vpc_name}-gw"
#   }
# }


# resource "aws_internet_gateway_attachment" "name" {
#   vpc_id              = aws_vpc.main.id
#   internet_gateway_id = aws_internet_gateway.gw.id
# }

# resource "aws_subnet" "subnet" {
#   count                   = length(var.subnet_configs)
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = var.subnet_configs[count.index]["cidr_block"]
#   availability_zone       = var.subnet_configs[count.index]["availability_zone"]
#   map_public_ip_on_launch = var.subnet_configs[count.index]["allow_public_ip"]

#   tags = {
#     Name = "${var.vpc_name}-${var.subnet_configs[count.index]["name"]}-${count.index + 1}"
#   }
# }


# resource "aws_route_table" "route_table_configs" {
#   count = length(var.route_table_variable)

#   vpc_id = aws_vpc.main.id
#   tags   = { Name = var.route_table_variable[count.index].name }

#   dynamic "route" {
#     for_each = var.route_table_variable[count.index].routes

#     content {
#       cidr_block = route.value.cidr_block
#       gateway_id = route.value.gateway_id
#     }
#   }
# }