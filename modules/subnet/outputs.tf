output "nat_gateway_id" {
  value = aws_nat_gateway.nat_gateway_for_subnet[0].id
}