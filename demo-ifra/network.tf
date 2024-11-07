resource "azurerm_network_security_group" "tfl-nsg" {
  name                = var.nsg_name
  location            = azurerm_resource_group.rg-tfl-infra.location
  resource_group_name = azurerm_resource_group.rg-tfl-infra.name
}

resource "azurerm_virtual_network" "tfl-vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.rg-tfl-infra.location
  resource_group_name = azurerm_resource_group.rg-tfl-infra.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
}

resource "azurerm_subnet" "tfl-subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg-tfl-infra.name
  virtual_network_name = azurerm_virtual_network.tfl-vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_subnet_network_security_group_association" "nsg_snet_association" {
  subnet_id                 = azurerm_subnet.tfl-subnet.id
  network_security_group_id = azurerm_network_security_group.tfl-nsg.id
}