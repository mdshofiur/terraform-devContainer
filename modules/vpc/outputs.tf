output "vpc_name" {
  value = var.vpc_name
}

output "aws_vpc_id" {
  value = aws_vpc.main.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.gw.id
}


