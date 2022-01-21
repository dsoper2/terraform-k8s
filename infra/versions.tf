# Terraform and Intersight Provider Information 
terraform {
  required_version = ">= 1.1.3"

  required_providers {
    intersight = {
      source  = "ciscodevnet/intersight"
      version = ">= 1.0.21"
    }
  }
}
