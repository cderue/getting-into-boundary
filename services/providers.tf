terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.74.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.29.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Alternatively you could pass these values via workspaces, variables, TFE provider, or TF State
data "azurerm_kubernetes_cluster" "main" {
  name = local.aks_cluster_name
  resource_group_name = local.resource_group_name
}

#data "aws_eks_cluster_auth" "main" {
#  name = local.aks_cluster_name
#}

#provider "kubernetes" {
#  host                   = data.aws_eks_cluster.main.endpoint
#  cluster_ca_certificate = base64decode(data.aws_eks_cluster.main.certificate_authority.0.data)
#  token                  = data.aws_eks_cluster_auth.main.token
#}

# Kubernetes provider using AKS details
provider "kubernetes" {
  host                   = azurerm_kubernetes_cluster.main.kube_config.0.host
  client_certificate      = base64decode(data.azurerm_kubernetes_cluster.main.kube_config.0.client_certificate)
  client_key              = base64decode(data.azurerm_kubernetes_cluster.main.kube_config.0.client_key)
  cluster_ca_certificate  = base64decode(data.azurerm_kubernetes_cluster.main.kube_config.0.cluster_ca_certificate)
}







# Use a variable for the Azure region and tags as done in AWS config
variable "azure_location" {
  description = "The Azure region where resources should be created."
  type        = string
}

variable "azure_tags" {
  description = "Tags to apply to Azure resources."
  type        = map(string)
  default     = {}
}






