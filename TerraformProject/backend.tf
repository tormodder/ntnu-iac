terraform {
  backend "azurerm" {
    resource_group_name  = "tfl-rg-backend-tfstate"
    storage_account_name = "tflsabetsny9ynoj2se"
    container_name       = "tflscbets"
    key                  = "terraform.tfstate"
  }
}