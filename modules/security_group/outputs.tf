output "dev_security_group_id" {
  value = aws_security_group.dev_security_group[0].id
}
