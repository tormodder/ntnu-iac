terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.1.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tfl-rg-backend-tfstate"
    storage_account_name = "tflsabetsny9ynoj2se"
    container_name       = "tflscbets"
    key                  = "project_b.tfstate"
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {

  }
}

resource "azurerm_resource_group" "rg_b" {
  name     = var.resource_group_name
  location = var.location
}