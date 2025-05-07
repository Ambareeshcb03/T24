resource "azurerm_resource_group" "rg1" {
   name     = var.rg_name
   location = var.rg_location
}

resource "azurerm_virtual_network" "vnet1" {
   name                 = var.vnet_name
   resource_group_name  = azurerm_resource_group.rg1.name
   location             = azurerm_resource_group.rg1.location
   address_space        = var.address_space
}

resource "azurerm_subnet" "subnet" {
    count                   = length(var.subnet_name) # 4
    name                    = var.subnet_name[count.index] # subnet_name[0]= subnet1,subnet_name[1]= subnet2,subnet_name[2]= subnet3,subnet_name[3]= subnet4
    resource_group_name     = azurerm_resource_group.rg1.name 
    virtual_network_name    = azurerm_virtual_network.vnet1.name 
    address_prefixes        = [ "10.10.${count.index}.0/24" ] # 10.10.0.0/24  
}

resource "azurerm_network_interface" "nic" {
    count                   = 4
    name                    = "nextopsnic${count.index}" #nextopsnic0, nextopsnic1
    resource_group_name = azurerm_resource_group.rg1.name
    location            = azurerm_resource_group.rg1.location

    ip_configuration {
        name                          = "internal"
        subnet_id                     = azurerm_subnet.subnet[count.index].id
        private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_linux_virtual_machine" "vm" {
  count               = 4
  name                = "nextopsvm${count.index}"
  resource_group_name = azurerm_resource_group.rg1.name
  location            = azurerm_resource_group.rg1.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.nic[count.index].id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    #ssh-keygen -t rsa -f C:\Class_Code\T24\Terraform\14_loops\count\SSH_Keys\id_rsa <--- command to generate keys
    public_key = file("C:/Class_Code/T24/Terraform/14_loops/count/SSH_Keys/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}