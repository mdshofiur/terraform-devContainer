resource "aws_vpc" "k3s_cluster_vpc" {
  cidr_block           = var.vpc_cidr_base
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(var.tags, {
    Name = var.vpc_name
  })
}

resource "aws_internet_gateway" "gw" {
  tags = {
    Name = "${var.vpc_name}-gw"
  }
}


resource "aws_internet_gateway_attachment" "name" {
  vpc_id              = aws_vpc.k3s_cluster_vpc.id
  internet_gateway_id = aws_internet_gateway.gw.id
}













