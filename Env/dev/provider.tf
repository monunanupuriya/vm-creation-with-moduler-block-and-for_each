terraform {

  backend "azurerm" {
    resource_group_name  = "mk-backend"
    storage_account_name = "mkbackendstorage"
    container_name       = "mkstorage"
    key                  = "backend.rg.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.59.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "caba13fb-1019-44a6-817f-cc5eb0ec1c55"
}