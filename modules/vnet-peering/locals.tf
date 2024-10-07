# Convenience locals for usage throughout the project
locals {
  connectivity_subscription_id = "${var.allow_cross_subscription_peering ? var.subscription_ids[0] : data.azurerm_subscription.current.subscription_id}"
  sandbox_subscription_id = "${var.allow_cross_subscription_peering ? var.subscription_ids[1] : data.azurerm_subscription.current.subscription_id}"
}