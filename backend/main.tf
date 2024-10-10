terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.4.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tfl-rg-backend-tfstate"
    storage_account_name = "tflsabets5q6d9ouy79"
    container_name       = "tfl-tfstate"
    key                  = "backend.terraform.tfstate"
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

resource "random_string" "random_string" {
  length  = 10
  special = false
  upper   = false
}


resource "azurerm_resource_group" "tfl_rg_backend" {
  name     = var.rg_backend_name
  location = var.rg_backend_location
}

resource "azurerm_storage_account" "tfl_sa_backend" {
  name                     = "${lower(var.sa_backend_name)}${random_string.random_string.result}"
  resource_group_name      = azurerm_resource_group.tfl_rg_backend.name
  location                 = azurerm_resource_group.tfl_rg_backend.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "tfl_sc_backend" {
  name                  = var.sc_backend_name
  storage_account_name  = azurerm_storage_account.tfl_sa_backend.name
  container_access_type = "private"
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "tfl_kv_backend" {
  name                        = "${lower(var.kv_backend_name)}-${random_string.random_string.result}"
  location                    = azurerm_resource_group.tfl_rg_backend.location
  resource_group_name         = azurerm_resource_group.tfl_rg_backend.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get", "List", "Create"
    ]

    secret_permissions = [
      "Get", "Set", "List"
    ]

    storage_permissions = [
      "Get", "Set", "List"
    ]
  }
}

resource "azurerm_key_vault_secret" "tfl_sa_backend_accesskey" {
  name         = var.sa_backend_accesskey_name
  value        = azurerm_storage_account.tfl_sa_backend.primary_access_key
  key_vault_id = azurerm_key_vault.tfl_kv_backend.id
}
