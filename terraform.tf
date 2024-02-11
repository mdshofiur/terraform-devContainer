terraform {

  cloud {
    organization = "expertchamber"

    workspaces {
      name = "blueprint-test"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.32.1"
    }
  }

  required_version = ">= 1.1.0"
}
