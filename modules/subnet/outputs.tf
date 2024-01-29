output "aws_subnet_public_ids" {
  value = aws_subnet.subnet.*.id
}
