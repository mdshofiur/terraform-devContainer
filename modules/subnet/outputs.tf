output "nat_gateway_id" {
  value = aws_nat_gateway.nat_gateway_for_subnet[0].id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnets[0].id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnets[0].id
}
