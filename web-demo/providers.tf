terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.4.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tfl-rg-backend-tfstate"
    storage_account_name = "tflsabetswubl97ofwy"
    container_name       = "tflscbets"
    key                  = "web-demo.terraform.tfstate" #MÅ endres hver gang backend brukes
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

