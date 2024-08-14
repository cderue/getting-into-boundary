variable "project_name" {
  type        = string
  description = "The name of the project. Used for naming resources."
  default     = "getting-into-boundary"
}

variable "aws_default_tags" {
  type        = map(string)
  description = "Default tags added to all AWS resources."
  default = {
    Project = "getting-into-boundary"
  }
}

variable "aws_default_region" {
  type        = string
  description = "The default region that all resources will be deployed into."
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  type        = string
  description = "Cidr block for the VPC."
  default     = "10.0.0.0/16"
}

variable "ec2_kepair_name" {
  type        = string
  description = "The name of the EC2 key pair to use for remote access."
}

variable "remote_access_cidr_block" {
  type        = string
  description = "CIDR block for remote access."
  default     = "0.0.0.0/0"
}

variable "eks_cluster_version" {
  type        = string
  description = "The version of Kubernetes for EKS to use."
  default     = "1.29"
}

# HCP Variables

variable "hvn_cidr_block" {
  type        = string
  description = "Cidr block for the HCP HVN. Cannot overlap with VPC CIDR block."
  default     = "172.25.16.0/20"
}

variable "hcp_boundary_worker_tags" {
  type        = list(string)
  description = "Tags to apply to the Boundary worker instance."
  default     = ["worker"]
}

variable "hcp_boundary_worker_count" {
  type        = number
  description = "The number of Boundary worker instances to deploy."
  default     = 2
}