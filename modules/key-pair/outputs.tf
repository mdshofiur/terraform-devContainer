output "key_pair_name" {
  value = aws_key_pair.dev_key_pair.key_name
}

# output "tls_public_key" {
#   value = data.tls_public_key.dev_public_key.public_key_pem
# }
