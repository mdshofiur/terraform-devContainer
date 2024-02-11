# For public subnet configurations
resource "aws_subnet" "public_subnets" {
  count                   = length(var.public_subnet_configs)
  vpc_id                  = var.public_subnet_configs[count.index].vpc_id
  cidr_block              = var.public_subnet_configs[count.index].cidr_block
  availability_zone       = var.public_subnet_configs[count.index].availability_zone
  map_public_ip_on_launch = var.public_subnet_configs[count.index].allow_public_ip
  tags = {
    Name = var.public_subnet_configs[count.index].name
  }
}

resource "aws_route_table" "public_subnets_table" {
  # count  = length(var.aws_route_table_public)
  count  = length(var.public_subnet_configs)
  vpc_id = var.aws_route_table_public[count.index].vpc_id

  dynamic "route" {
    for_each = var.aws_route_table_public[count.index].routes
    content {
      cidr_block = route.value.cidr_block
      gateway_id = route.value.gateway_id
    }
  }
  tags = {
    Name = var.aws_route_table_public[count.index].route_table_name
  }
}


resource "aws_route_table_association" "public_subnet_association" {
  count          = length(var.public_subnet_configs)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_subnets_table[count.index].id
}