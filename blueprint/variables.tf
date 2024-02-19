/* -------------------------------------------------------------------------- */
/*                          VPC variable definitions                          */
/* -------------------------------------------------------------------------- */
variable "vpc_cidr" {
  type = string
}


variable "name" {
  type = string
}

/* -------------------------------------------------------------------------- */
/*                     Public subnet variable definitions                     */
/* -------------------------------------------------------------------------- */
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
  type = list(object({
    public_route_table_name = string
    public_vpc_id           = string
    public_routes = list(object({
      cidr_block = string
      gateway_id = string
    }))
  }))
  description = "List of Route Table configurations"
}


/* -------------------------------------------------------------------------- */
/*                     Private subnet variable definitions                    */
/* -------------------------------------------------------------------------- */



variable "private_subnet_variables" {
  type = list(object({
    private_subnet_name              = string
    private_subnet_cidr_block        = string
    private_subnet_availability_zone = string
    vpc_id                           = string
    vpc_name                         = string
  }))
  description = "List of Private subnet configurations"
}


variable "aws_route_table_for_private_subnets" {
  type = list(object({
    private_route_table_name = string
    private_vpc_id           = string
    private_routes = list(object({
      cidr_block = string
      gateway_id = string
    }))
  }))
  description = "List of Route Table configurations"
}

/* -------------------------------------------------------------------------- */
/*                          Security Group variables                          */
/* -------------------------------------------------------------------------- */


variable "frontend_sg_details" {
  type = list(object({
    name           = string
    vpc_attachment = string
    frontend_ingress = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
      description = string
    }))
    frontend_egress = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
      description = string
    }))
  }))
  description = "List of Security Group configurations"
}
