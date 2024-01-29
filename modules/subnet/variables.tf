variable "public_subnet_configs" {
  type = list(object({
    name : string,
    cidr_block : string,
    availability_zone : string,
    allow_public_ip : bool,
    vpc_id : string,
    vpc_name : string
  }))
  description = "List of Public subnet configurations"
}


# variable "public_route_table_association" {
#   type = object({
#     subnet_id      = string
#     route_table_id = string
#   })
#   description = "Map of route table association"
# }



variable "private_subnet_configs" {
  type = list(object({
    name : string,
    cidr_block : string,
    availability_zone : string,
    allow_public_ip : bool,
    vpc_id : string,
    vpc_name : string
  }))
  description = "List of Private subnet configurations"
}
