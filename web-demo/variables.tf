variable "subscription_id" {
  type        = string
  description = "Subscription ID"
  sensitive   = true
}

variable "rg_name" {
  type        = string
  description = "Name of Resource Group"
  default     = "rg-tfl-web-${terraform.workspace}"
}

variable "location" {
  type        = string
  description = "Location of Resource Group"
  default     = "westeurope"
}

variable "sa_tfl_name" {
  type        = string
  description = "Name of the Storage Account"
  default     = "satflweb"
}

variable "source_content" {
  type        = string
  description = "Source content of the index.html file"
  default     = "<h1>Made with Terraform - CI/CD pipeline</h1>"
}

variable "index_document" {
  type        = string
  description = "Name of the index document"
  default     = "index.html"
}
