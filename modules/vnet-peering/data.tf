data "azurerm_subscription" "current" {}

data "azurerm_resource_group" "connectivity" {
  provider = "azurerm.connectivity"
  name     = "${var.resource_group_names[0]}"
}

data "azurerm_resource_group" "sandbox" {
  provider = "azurerm.sandbox"
  name     = "${var.resource_group_names[1]}"
}

data "azurerm_virtual_network" "connectivity" {
  provider            = "azurerm.connectivity"
  name                = "${var.vnet_names[0]}"
  resource_group_name = "${data.azurerm_resource_group.connectivity.name}"
}

data "azurerm_virtual_network" "sandbox" {
  provider            = "azurerm.sandbox"
  name                = "${var.vnet_names[1]}"
  resource_group_name = "${data.azurerm_resource_group.sandbox.name}"
}
