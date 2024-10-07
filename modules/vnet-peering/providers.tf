terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.74.0"
    }
  }
}

provider "azurerm" {
  alias           = "connectivity"
  subscription_id = "${local.connectivity_subscription_id}"
  features {}
}

provider "azurerm" {
  alias           = "sandbox"
  subscription_id = "${local.sandbox_subscription_id}"
  features {}
}
