output "internet_gateway_id" {
  value = module.vpc.aws_internet_gateway.gw.id
}
