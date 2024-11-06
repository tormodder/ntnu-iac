terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.4.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tfl-rg-backend-tfstate"
    storage_account_name = "tflsabetsny9ynoj2se"
    container_name       = "tflscbets"
    key                  = "web-demo.terraform.tfstate" #MÅ endres hver gang backend brukes
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

