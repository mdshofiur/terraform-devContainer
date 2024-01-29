resource "aws_subnet" "public-subnet" {
  count                   = length(var.public_subnet_configs)
  vpc_id                  = var.public_subnet_configs[count.index]["vpc_id"]
  cidr_block              = var.public_subnet_configs[count.index]["cidr_block"]
  availability_zone       = var.public_subnet_configs[count.index]["availability_zone"]
  map_public_ip_on_launch = var.public_subnet_configs[count.index]["allow_public_ip"]

  tags = {
    Name = "${var.public_subnet_configs[count.index]["vpc_name"]}-${var.public_subnet_configs[count.index]["name"]}-${count.index + 1}"
  }
}


resource "aws_subnet" "private-subnet" {
  count                   = length(var.private_subnet_configs)
  vpc_id                  = var.public_subnet_configs[count.index]["vpc_id"]
  cidr_block              = var.private_subnet_configs[count.index]["cidr_block"]
  availability_zone       = var.private_subnet_configs[count.index]["availability_zone"]
  map_public_ip_on_launch = var.private_subnet_configs[count.index]["allow_public_ip"]

  tags = {
    Name = "${var.private_subnet_configs[count.index]["vpc_name"]}-${var.private_subnet_configs[count.index]["name"]}-${count.index + 1}"
  }
}
