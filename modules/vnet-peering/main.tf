
resource "azurerm_virtual_network_peering" "peer_connectivity_sandbox" {
  name                         = "${var.vnet_peering_names[0]}"
  resource_group_name          = "${data.azurerm_resource_group.connectivity.name}"
  virtual_network_name         = "${data.azurerm_virtual_network.connectivity.name}"
  remote_virtual_network_id    = "${data.azurerm_virtual_network.sandbox.id}"
  allow_virtual_network_access = "${var.allow_virtual_network_access}"
  allow_forwarded_traffic      = "${var.allow_forwarded_traffic}"
  use_remote_gateways          = "${var.use_remote_gateways}"
}

resource "azurerm_virtual_network_peering" "peer_sandbox_connectivity" {
  name                         = "${var.vnet_peering_names[1]}"
  resource_group_name          = "${data.azurerm_resource_group.sandbox.name}"
  virtual_network_name         = "${data.azurerm_virtual_network.sandbox.name}"
  remote_virtual_network_id    = "${data.azurerm_virtual_network.connectivity.id}"
  allow_virtual_network_access = "${var.allow_virtual_network_access}"
  allow_forwarded_traffic      = "${var.allow_forwarded_traffic}"
  use_remote_gateways          = "${var.use_remote_gateways}"
}