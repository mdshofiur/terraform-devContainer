variable "subnet_configs" {
  type = list(object({
    name : string,
    cidr_block : string,
    availability_zone : string,
    allow_public_ip : bool
  }))
  description = "List of subnet configurations"
}

