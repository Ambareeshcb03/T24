data "azurerm_resource_group" "existingrg" {
    name = "NextOpsRG01"
}

data "azurerm_virtual_network" "existingvnet" {
    name                = "NextOpsVNET01"
    resource_group_name = data.azurerm_resource_group.existingrg.name
}

resource "azurerm_subnet" "tfsubnet1" {
    name                 = "TFSubnet01"
    resource_group_name  = data.azurerm_resource_group.existingrg.name
    virtual_network_name = data.azurerm_virtual_network.existingvnet.name 
    address_prefixes     = [ "10.0.3.0/24" ]
}

resource "azurerm_subnet" "tfsubnet2" {
    name                 = "TFSubnet02"
    resource_group_name  = data.azurerm_resource_group.existingrg.name
    virtual_network_name = data.azurerm_virtual_network.existingvnet.name 
    address_prefixes     = [ "10.0.5.0/24" ]
}