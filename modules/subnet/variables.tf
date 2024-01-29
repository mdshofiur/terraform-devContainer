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




variable "public_aws_route" {
  type = object({
    cidr_block = string
    gateway_id = string
  })
}



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
