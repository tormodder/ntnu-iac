locals {
  workspace_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"

  rg_name    = terraform.workspace == "default" ? "${var.rg_name}" : "${var.rg_name}-${local.workspace_suffix}"
  sa_name    = terraform.workspace == "default" ? "${var.sa_tfl_name}" : "${var.sa_tfl_name}${local.workspace_suffix}"
  web_suffix = "<h1>${terraform.workspace}</h1>"
}

resource "random_string" "random_string" {
  length  = 8
  special = false
  upper   = false
}

# Create Resource Group
resource "azurerm_resource_group" "tfl_rg_web" {
  name     = "${var.rg_name}-${terraform.workspace}"
  location = var.location
}

# Create Storage Account
resource "azurerm_storage_account" "sa_tfl_web" {
  name                     = "${var.sa_tfl_name}${random_string.random_string.result}"
  resource_group_name      = azurerm_resource_group.tfl_rg_web.name
  location                 = azurerm_resource_group.tfl_rg_web.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  static_website {
    index_document = var.index_document
  }
}

# Add a index.html file to the storage account
resource "azurerm_storage_blob" "index_html" {
  name                   = var.index_document
  storage_account_name   = azurerm_storage_account.sa_tfl_web.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = "${var.source_content}${local.web_suffix}"
}

output "primary_web_endpoint" {
  value = azurerm_storage_account.sa_tfl_web.primary_web_endpoint
}


# destroy
