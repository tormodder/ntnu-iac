# Resource group for all resources
resource "azurerm_resource_group" "rg-tfl-infra" {
  name     = "${var.rg_name}-${var.base_name}"
  location = var.location
}

resource "random_string" "random_string" {
  length  = 10
  special = false
  upper   = false
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!%&*()-_=+[]{}<>:?"
}

output "vm_password" {
  value     = var.vm_password
  sensitive = true
}
