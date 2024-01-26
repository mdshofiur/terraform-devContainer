## Terraform DevContainer

# AWS VPC Module

This Terraform module creates a VPC with public and private subnets.

## Usage

```hcl
module "vpc" {
  source = "./vpc"

  vpc_name         = "my-vpc"
  vpc_cidr_block   = "10.0.0.0/16"
  azs              = ["us-east-1a"]
  allow_public_ip  = [true, false]
  private_subnets  = ["10.20.0.0/24"]
  public_subnets   = ["10.40.0.0/24"]
}
