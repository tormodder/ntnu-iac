variable "rg_name" {
  type        = string
  description = "Name of resource group"
}

variable "rg_location" {
  type        = string
  description = "Location of the resource group"
}

variable "subscription_id" {
  type        = string
  description = "Subscription ID for azure"
  sensitive   = true
}
