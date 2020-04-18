#########
# Backend
#########
terraform {
  required_version = ">= 0.12.0"

  backend "local" {
    path = ".terraform/tf-state/terraform.tfstate"
  }
  required_providers {
    influxdb = ">= 1.3"
  }
}
