resource "aws_key_pair" "name" {
  key_name    = var.key_pair_name
  key_pair_id = "k3s_key_pair"
  public_key  = file(var.public_key_path)
}
