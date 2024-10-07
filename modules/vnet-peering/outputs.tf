output "peer_connectivity_sandbox_id" {
  description = "The id of the newly created virtual network peering in on first virtual network. "
  value       = "${azurerm_virtual_network_peering.peer_connectivity_sandbox.id}"
}

output "peer_sandbox_connectivity_id" {
  description = "The id of the newly created virtual network peering in on second virtual network. "
  value       = "${azurerm_virtual_network_peering.peer_sandbox_connectivity.id}"
}