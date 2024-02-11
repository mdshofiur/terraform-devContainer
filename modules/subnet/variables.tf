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

variable "aws_route_table_public" {
  type = list(object({
    route_table_name : string,
    vpc_id : string,
    routes : list(object({
      cidr_block : string,
      gateway_id : string,
    }))
  }))
  description = "List of Route Table configurations"
}

