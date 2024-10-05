resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}

resource "azurerm_resource_group" "rg" {
  location = var.azure_location
  name     = "rg-${var.project_name}-${var.deployment-environment}-001"
}