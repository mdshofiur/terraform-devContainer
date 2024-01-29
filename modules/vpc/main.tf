resource "aws_vpc" "main" {
  cidr_block           = "${var.vpc_cidr_base}.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "gw" {
  tags = {
    Name = "${var.vpc_name}-gw"
  }
}


resource "aws_internet_gateway_attachment" "name" {
  vpc_id              = aws_vpc.main.id
  internet_gateway_id = aws_internet_gateway.gw.id
}