output "vpc_id_output" {
  value = module.my_vpc.vpc_id
}

output "vpc_name_output" {
  value = module.my_vpc.vpc_name
}


output "vpc_gatway_id_output" {
  value = module.my_vpc.internet_gateway_id
}


output "nat_gateway_id_output" {
  value = module.public_subnet_details.nat_gateway_id
}