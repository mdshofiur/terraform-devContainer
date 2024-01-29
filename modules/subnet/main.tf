resource "aws_subnet" "subnet" {
  count                   = length(var.subnet_configs)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_configs[count.index]["cidr_block"]
  availability_zone       = var.subnet_configs[count.index]["availability_zone"]
  map_public_ip_on_launch = var.subnet_configs[count.index]["allow_public_ip"]

  tags = {
    Name = "${var.vpc_name}-${var.subnet_configs[count.index]["name"]}-${count.index + 1}"
  }
}
