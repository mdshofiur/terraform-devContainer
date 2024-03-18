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
    route_table_name = string
    vpc_id           = string
    routes = list(object({
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
    route_table_name = string
    vpc_id           = string
    routes = list(object({
      cidr_block = string
      gateway_id = string
    }))
  }))
  description = "List of Route Table configurations"
}

/* -------------------------------------------------------------------------- */
/*                          Security Group variables                          */
/* -------------------------------------------------------------------------- */


variable "sg_details" {
  description = "List of Security Group configurations"
  type = list(object({
    sg_name                = string
    vpc_attachment_with_id = string
    ingress_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
      description = string
    }))
    egress_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
      description = string
    }))
  }))
}

/* -------------------------------------------------------------------------- */
/*                          Key Pair variable definitions                     */
/* -------------------------------------------------------------------------- */

variable "key_pair_name" {
  type        = string
  description = "Name of the key pair"
}

variable "public_key_dir" {
  type        = string
  description = "Path to the public key"
}


/* -------------------------------------------------------------------------- */
/*                          EC2 instance variable definitions                 */
/* -------------------------------------------------------------------------- */

variable "ec2_instance" {
  type = list(object({
    instance_type              = string
    instance_name              = string
    instance_allow_public_ip   = bool
    instance_key_name          = string
    instance_security_group_id = list(string)
    instance_subnet_id         = string
  }))
  description = "List of EC2 instance configurations"
}
