# Grab remote outputs from the infrastructure workspace and use in place of the variables if available
# Requirements: allow shared outputs between infrastructure -> services workspace in HCP Terraform
data "terraform_remote_state" "infrastructure" {
  backend = "remote"

  config = {
    organization = var.hcp_terraform_organization_name
    workspaces = {
      name = var.hcp_terraform_infrastructure_workspace_name
    }
  }
}

locals {
  aks_cluster_name = try(data.terraform_remote_state.infrastructure.outputs.aks_cluster_name, var.aks_cluster_name)
  resource_group_name = try(data.terraform_remote_state.infrastructure.outputs.resource_group_name, var.resource_group_name)
  public_subnet_ids = try(data.terraform_remote_state.infrastructure.outputs.public_subnet_ids, var.public_subnet_ids)
}

