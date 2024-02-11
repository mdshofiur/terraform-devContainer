# VPC variable definitions
variable "vpc_cidr" {
  type = string
}

variable "name" {
  type = string
}

# Public subnet variable definitions
variable "public_subnet_variables" {
  type = list(object({
    public_subnet_name              = string
    public_subnet_cidr_block        = string
    public_subnet_availability_zone = string
    public_subnet_allow_public_ip   = bool
    vpc_id                          = string
    vpc_name                        = string
  }))
  description = "List of Public subnet configurations"
}

# Public subnet variable definitions
# variable "public_subnet_variables" {
#   type = list(object({
#     name : var.public_subnet_name,
#     cidr_block : var.public_subnet_cidr_block,
#     availability_zone : var.public_subnet_availability_zone,
#     allow_public_ip : var.public_subnet_allow_public_ip,
#     vpc_id : var.vpc_id,
#     vpc_name : var.vpc_name
#   }))
#   description = "List of Public subnet configurations"
# }



