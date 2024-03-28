# variable "ec2_instance_type" {
#   description = "The type of EC2 instance to launch"
#   default     = "t2.micro"
# }

# variable "ec2_ami_filter" {
#   description = "The filter to use for the EC2 AMI"
#   default = {
#     name                = "web"
#     values              = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
#     virtualization-type = "hvm"
#     architecture        = "x86_64"
#     owners              = ["099720109477"] # Canonical
#   }
# }


# variable "ec2_instance_tags" {
#   description = "The tags to apply to the EC2 instance"
#   default = {
#     Name = "web"
#   }
# }

# variable "ec2_instance_count" {
#   description = "The number of EC2 instances to launch"
#   default     = 1
# }

# variable "ec2_instance_name" {
#   description = "The name of the EC2 instance"
#   default     = "web"
# }


# variable "ec2_instance_allow_public_ip" {
#   description = "Whether to allow the EC2 instance to have a public IP address"
#   default     = true
# }

# variable "ec2_instance_key_name" {
#   description = "The name of the EC2 instance key pair"
#   default     = "mykey"
# }

# variable "ec2_instance_security_group" {
#   description = "The security group to apply to the EC2 instance"
#   default     = "default"
# }

# variable "ec2_instance_subnet_id" {
#   description = "The subnet ID to launch the EC2 instance in"
#   default     = "subnet-12345678"
# }



# variable "ec2" {
#   type = list(object({
#     instance_type = string
#     # ami_filter               = map(string)
#     # instance_tags            = map(string)
#     instance_name              = string
#     instance_allow_public_ip   = bool
#     instance_key_name          = string
#     instance_security_group_id = string
#     instance_subnet_id         = string
#   }))
# }

variable "instance_variables" {
  type = list(object({
    instance_type              = string
    instance_name              = string
    instance_allow_public_ip   = bool
    instance_key_name          = string
    instance_security_group_id = list(string)
    instance_subnet_id         = string
  }))
  description = "List of EC2 instance configurations"
}
