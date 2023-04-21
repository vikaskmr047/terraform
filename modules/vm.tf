resource "azurerm_linux_virtual_machine" "vm" {
  name = var.vm_name
  resource_group_name = azurerm_resource_group.rg.name
  location = var.location
  size = var.vm_size
 admin_username = var.admin_username
 admin_password = var.admin_password
 os_disk {
   name = "${var.vm_name}-osdisk"
   caching = "ReadWrite"
   storage_account_type = "Standard_LRS"
 }
network_interface_ids = [azurerm_network_interface.nic.id]
source_image_reference {
            publisher = "Canonical"
            offer     = "UbuntuServer"
            sku       = "16.04-LTS"
            version   = "latest"
}
 disable_password_authentication = false

}