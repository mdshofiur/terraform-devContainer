/* -------------------------------------------------------------------------- */
/*                  Variables for the frontend security group                 */
/* -------------------------------------------------------------------------- */
variable "frontend_sg" {
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
  description = "Security group for frontend servers"
}

