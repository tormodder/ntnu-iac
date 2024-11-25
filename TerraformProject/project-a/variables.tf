# Variables for the main configuration
variable "resource_group_name" {
  type        = string
  default     = "rg-demo-project-a-tfl"
  description = "The name of the resource group"
}
variable "location" {
  type        = string
  default     = "westeurope"
  description = "The location of the storage account"
}

# Variables for the storage account
variable "storage_account_name" {
  type        = string
  default     = "sademotfl" 
  description = "The name of the storage account"
}

variable "subscription_id" {
  type        = string
  description = "subscription ID"
}