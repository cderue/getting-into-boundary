resource "azurerm_resource_group" "rg1" {
  provider = "azurerm.sub1"
  location = var.azure_location
  name     = "rg-${var.project_name}-${var.deployment-environment}-001"
}

resource "azurerm_resource_group" "rg2" {
  provider = "azurerm.sub2"
  location = var.azure_location
  name     = "rg-${var.project_name}-${var.deployment-environment}-002"
}