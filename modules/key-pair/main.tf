resource "aws_key_pair" "dev_key_pair" {
  key_name   = var.key_pair_name
  public_key = file(var.public_key_path)
}


# resource "tls_private_key" "rsa-4096" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }


# resource "local_file" "access_key" {
#   content  = tls_private_key.rsa-4096.private_key_pem
#   filename = "${path.module}/access_key.pub"
# }

# resource "local_file" "access_key_3" {
#   content  = tls_private_key.rsa-4096.private_key_pem
#   filename = "${path.cwd}/access_key.pub"
# }

# resource "local_file" "access_key_2" {
#   content  = tls_private_key.rsa-4096.private_key_pem
#   filename = "${path.root}/access_key.pub"
# }

# resource "local_sensitive_file" "name" {
#   filename = "${path.cwd}secret.txt"
#   content  = "sensitive data"
# }

# resource "null_resource" "print_public_key" {
#   provisioner "local-exec" {
#     command = "cp access_key.pub ${path.module}/k3s_key_pair.pub"
#   }
# }



# resource "aws_key_pair" "dev_key_pair" {
#   key_name   = var.key_pair_name
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
# }
