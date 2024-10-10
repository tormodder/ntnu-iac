variable "rg_backend_name" {
  type        = string
  description = "Name of the resource group"
}

variable "rg_backend_location" {
  type        = string
  description = "Location for the resource group"
}

variable "sa_backend_name" {
  type        = string
  description = "Name of the Storage Account"
}

variable "sc_backend_name" {
  type        = string
  description = "Name of the Storage Container"
}

variable "kv_backend_name" {
  type        = string
  description = "Name of the Key Vault"
}

variable "sa_backend_accesskey_name" {
  type        = string
  description = "Name of the Access Key"
}

variable "subscription_id" {
  type        = string
  description = "Subscription ID for azure"
  sensitive   = true
}
