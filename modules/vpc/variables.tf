variable "vpc_cidr_base" {
  default     = "10.0"
  description = "value for the first two octets of the VPC CIDR block"
}

variable "vpc_name" {
  type        = string
  description = "Name tag for the VPC"
}