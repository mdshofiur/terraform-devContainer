/* -------------------------------------------------------------------------- */
/*                     Security Group for Frontend Servers                    */
/* -------------------------------------------------------------------------- */

resource "aws_security_group" "dev_security_group" {
  count = length(var.security_group)

  name   = var.security_group[count.index].name
  vpc_id = var.security_group[count.index].vpc_attachment

  dynamic "ingress" {
    for_each = var.security_group[count.index].dev_ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      description = ingress.value.description
    }
  }

  dynamic "egress" {
    for_each = var.security_group[count.index].dev_egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
      description = egress.value.description
    }
  }

  tags = {
    Name = var.security_group[count.index].name
  }

}
