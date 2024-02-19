/* -------------------------------------------------------------------------- */
/*                     Security Group for Frontend Servers                    */
/* -------------------------------------------------------------------------- */

resource "aws_security_group" "frontend_sg" {
  count = length(var.frontend_sg)

  name   = var.frontend_sg[count.index].name
  vpc_id = var.frontend_sg[count.index].vpc_attachment

  dynamic "ingress" {
    for_each = var.frontend_sg[count.index].frontend_ingress
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      description = ingress.value.description
    }
  }

  dynamic "egress" {
    for_each = var.frontend_sg[count.index].frontend_egress
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
      description = egress.value.description
    }
  }

  tags = {
    Name = var.frontend_sg[count.index].name
  }

}
