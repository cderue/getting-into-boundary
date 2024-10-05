# Convenience locals for usage throughout the project
locals {
  tags = merge(
    {
      Module = "getting-into-boundary//modules/vnet",
    },
  var.tags)
  public_cidr_blocks  = [for i in range(var.public_subnet_count) : cidrsubnet(var.cidr_block, 3, i)]
  private_cidr_blocks = [for i in range(var.private_subnet_count) : cidrsubnet(var.cidr_block, 3, i + var.public_subnet_count)]
}