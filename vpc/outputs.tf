# output "private_subnet_ids" {
#   value = module.vpc.private_subnet_ids
# }



output "internet_gateway_id" {
  value = aws_internet_gateway.gw.id
}


# terraform output internet_gateway_id
