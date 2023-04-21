module "prod-vm" {
  source = "./modules"
  resource_group_name = var.resource_group_name
location = var.location
vm_name = var.vm_name
vm_size = var.vm_size
vnet_name = var.vnet_name
vnet_address_space = var.vnet_address_space
subnet_name = var.subnet_name
subnet_address_space = var.subnet_address_space
admin_username = var.admin_username
admin_password = var.admin_password
}