variable "vpc_cidr_base" {
  type        = string
  description = "value for the first two octets of the VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  type        = string
  description = "Name tag for the VPC"
  default     = "k3s_cluster"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
  default     = {}
}