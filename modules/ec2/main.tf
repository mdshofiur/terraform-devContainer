data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"] // 64-bit
  }

  owners = ["099720109477"] # Canonical

}



resource "aws_instance" "vm_instance" {
  count = length(var.ec2)

  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.ec2[count.index].instance_type
  associate_public_ip_address = var.ec2[count.index].instance_allow_public_ip

  key_name        = var.ec2[count.index].instance_key_name
  security_groups = var.ec2[count.index].instance_security_group_id
  subnet_id       = var.ec2[count.index].instance_subnet_id

  tags = {
    Name = var.ec2[count.index].instance_name
  }
}
