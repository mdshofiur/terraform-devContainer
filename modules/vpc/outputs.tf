# output "vpc_name" {
#   value = var.vpc_name
# }

output "vpc_id" {
  value = aws_vpc.k3s_cluster_vpc.id
}

output "vpc_name" {
  value = aws_vpc.k3s_cluster_vpc.tags["Name"]
}


# output "aws_vpc_id" {
#   value = aws_vpc.k3s_cluster_vpc.id
# }

# output "aws_vpc_name" {
#   value = aws_vpc.k3s_cluster_vpc.tags.Name
# }

output "internet_gateway_id" {
  value = aws_internet_gateway.gw.id
}
