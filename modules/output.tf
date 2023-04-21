output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "vm_name" {
  value = var.vm_name
}

output "vnet_name" {
  value = var.vnet_name
}
output "vnet_address" {
  value = var.vnet_address_space
}

output "subnet" {
  value = var.subnet_address_space
}

