resource "azurerm_resource_group" "existingrg" {
    name        = var.rg_name
    location    = var.rg_location
}

resource "azurerm_virtual_network" "existingvnet" {
    name                = var.vnet_name
    resource_group_name = azurerm_resource_group.existingrg.name
    location            = azurerm_resource_group.existingrg.location
    address_space       = var.vnet_addressspace #Arrays/List
}

resource "azurerm_subnet" "subnet1" {
    name                    = var.subnet1_name
    resource_group_name     = azurerm_resource_group.existingrg.name
    virtual_network_name    = azurerm_virtual_network.existingvnet.name
    address_prefixes        = [ "10.10.0.0/24" ]  
}

resource "azurerm_subnet" "subnet2" {
    name                    = var.subnet2_name
    resource_group_name     = azurerm_resource_group.existingrg.name
    virtual_network_name    = azurerm_virtual_network.existingvnet.name
    address_prefixes        = [ "10.10.1.0/24" ]  
}

resource "azurerm_subnet" "subnet3" {
    name                    = var.subnet3_name
    resource_group_name     = azurerm_resource_group.existingrg.name
    virtual_network_name    = azurerm_virtual_network.existingvnet.name
    address_prefixes        = [ "10.10.2.0/24" ]  
}

resource "azurerm_network_interface" "nic1" {
  name                = var.nic_name
  resource_group_name = azurerm_resource_group.existingrg.name
  location            = azurerm_resource_group.existingrg.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "vm1" {
  name                = var.vm_name
  resource_group_name = azurerm_resource_group.existingrg.name
  location = azurerm_resource_group.existingrg.location
  size                = var.vm_size
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.nic1.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}