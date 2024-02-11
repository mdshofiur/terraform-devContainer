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

variable "aws_route_table_for_public_subnets" {
  type        = list(object({
    route_table_name = string
    vpc_id           = string
    routes           = list(object({
      cidr_block = string
      gateway_id = string
    }))
  }))
  description = "List of Route Table configurations"
}

