output "id" {
  value       = azurerm_virtual_network.main.id
  description = "ID of the VNET"
}

output "arn" {
  value       = azurerm_virtual_network.main.arn
  description = "ARN of the VNET"
}

output "cidr_block" {
  value       = azurerm_virtual_network.main.cidr_block
  description = "IPv4 CIDR block of the VNET"
}

output "ipv6_cidr_block" {
  value       = try(azurerm_virtual_network.main.ipv6_cidr_block, null)
  description = "IPv6 CIDR block of the VNET"
}

#output "public_route_table_id" {
#  value       = aws_route_table.public.id
#  description = "ID of the VPC's public route table"
#}

#output "private_route_table_id" {
#  value       = aws_route_table.private.id
#  description = "ID of the VPC's private route table"
#}

output "public_subnet_ids" {
  value       = aws_subnet.public.*.id
  description = "List of public subnet IDs"
}

output "private_subnet_ids" {
  value       = aws_subnet.private.*.id
  description = "List of private subnet IDs"
}

output "public_subnet_cidr_blocks" {
  value = local.public_cidr_blocks
  description = "List of public subnet CIDR blocks"
}

output "private_subnet_cidr_blocks" {
  value = local.private_cidr_blocks
  description = "List of private subnet CIDR blocks"
}