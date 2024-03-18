/* -------------------------------------------------------------------------- */
/*                  Variables for the frontend security group                 */
/* -------------------------------------------------------------------------- */
variable "security_group" {
  type = list(object({
    name           = string
    vpc_attachment = string
    dev_ingress_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
      description = string
    }))
    dev_egress_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
      description = string
    }))
  }))
  description = "Security group for frontend servers"
}

