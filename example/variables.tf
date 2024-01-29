variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "vpc_name" {
  type        = string
  description = "Name tag for the VPC"
}

variable "subnet_configs" {
  type = list(object({
    name : string,
    cidr_block : string,
    availability_zone : string,
    allow_public_ip : bool
  }))
  description = "List of subnet configurations"
}


# variable "route_table_variable" {
#   type = list(object({
#     name        = string
#     subnet_name = string
#     routes = list(object({
#       cidr_block = string
#       gateway_id = string
#     }))
#   }))
#   description = "List of route table configurations"
# }

