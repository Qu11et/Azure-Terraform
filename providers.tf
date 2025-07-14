terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.71.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "terraform-state"
    storage_account_name = "tfstate2025lkht"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = false
}

