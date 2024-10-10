variable "subscription_id" {
  type        = string
  description = "Subscription ID"
}

variable "rg_name" {
  type        = string
  description = "Name of Resource Group"
}

variable "location" {
  type        = string
  description = "Location of Resource Group"
  default     = "westeurope"
}

variable "sa_tfl_name" {
  type        = string
  description = "Name of the Storage Account"
}

variable "source_content" {
  type        = string
  description = "Source content of the index.html file"
}

variable "index_document" {
  type        = string
  description = "Name of the index document"
}
