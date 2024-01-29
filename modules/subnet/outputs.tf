output "aws_subnet_public_id" {
  value = [for subnet in aws_subnet.public-subnet : subnet.id]
}

output "aws_subnet_private_id" {
  value = [for subnet in aws_subnet.private-subnet : subnet.id]
}


# output "public_table_id" {
#   value = [for table in aws_route_table.public_table : table.id]
# }

output "public_table_ids" {
  value = aws_route_table.public_table[*].id
}