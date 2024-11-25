variable "storage_account_name" {
    type = string
    default = "sademotfl"
    description = "The name of the storage account"
}
variable "resource_group_name" {
    type = string
    default = "rg-demo-tfl"
    description = "The name of the resource group"
}
variable "location" {
    type = string
    default = "westeurope"
    description = "The location of the storage account"
}