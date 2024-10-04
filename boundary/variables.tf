variable "azure_default_tags" {
  type        = map(string)
  description = "Default tags added to all Azure resources."
  default = {
    Project = "getting-into-boundary"
  }
}

variable "azure_location" {
  type        = string
  description = "The Azure region that all resources will be deployed into."
  default     = "west-europe"
}
