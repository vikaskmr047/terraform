resource "azurerm_virtual_network" "vnet" {
  name = var.vnet_name
  resource_group_name = var.resource_group_name
  location = var.location
  address_space = var.vnet_address_space
}

resource "azurerm_subnet" "subnet" {
  name = var.subnet_name
  address_prefixes = var.subnet_address_space
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name = var.resource_group_name
}

resource "azurerm_public_ip" "pip" {
  name = "${var.vm_name}-pip"
  allocation_method = "Dynamic"
  location = var.location
  resource_group_name = var.resource_group_name

  sku = "Basic"

}

resource "azurerm_network_interface" "nic" {
  name = "${var.vm_name}-nic"
  resource_group_name = var.resource_group_name
  location = var.location

  depends_on = [
    azurerm_subnet.subnet
  ]
  ip_configuration {
    name = "Internal"
    private_ip_address_allocation = "Dynamic"
    subnet_id = azurerm_subnet.subnet.id
    public_ip_address_id = azurerm_public_ip.pip.id
  }
}