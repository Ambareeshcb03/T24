resource "azurerm_resource_group" "existingrg" {
    name        = "ManualRG"
    location    = "eastus"
}

resource "azurerm_virtual_network" "existingvnet" {
    name = "ManualVNET01"
    resource_group_name = azurerm_resource_group.existingrg.name
    location = azurerm_resource_group.existingrg.location
    address_space = [ "10.10.0.0/16" ]
}

resource "azurerm_subnet" "subnet1" {
    name = "Subnet01"
    resource_group_name = azurerm_resource_group.existingrg.name
    virtual_network_name = azurerm_virtual_network.existingvnet.name
    address_prefixes = [ "10.10.0.0/24" ]  
}

resource "azurerm_subnet" "subnet2" {
    name = "Subnet02"
    resource_group_name = azurerm_resource_group.existingrg.name
    virtual_network_name = azurerm_virtual_network.existingvnet.name
    address_prefixes = [ "10.10.1.0/24" ]  
}

resource "azurerm_subnet" "subnet3" {
    name = "Subnet03"
    resource_group_name = azurerm_resource_group.existingrg.name
    virtual_network_name = azurerm_virtual_network.existingvnet.name
    address_prefixes = [ "10.10.2.0/24" ]  
}