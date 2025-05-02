locals {
   prefix           = "NextOps"
   rg_ref_name      = azurerm_resource_group.rg1.name
   rg_ref_location  = azurerm_resource_group.rg1.location
   vnet_ref_name    = azurerm_virtual_network.vnet1.name
}

resource "azurerm_resource_group" "rg1" {
    name        = join("-",[local.prefix,var.rg_name]) #NextOps-LocalsRG
    location    = var.rg_location
}

resource "azurerm_virtual_network" "vnet1" {
    name                    = join("-",[local.prefix,var.vnet_name]) #NextOps-LocalsVNET01
    resource_group_name     = local.rg_ref_name
    location                = local.rg_ref_location
    address_space           = [ "10.10.0.0/16" ]
}

resource "azurerm_subnet" "subnet1" {
    name = "Subnet01"
    resource_group_name = local.rg_ref_name
    virtual_network_name = local.vnet_ref_name
    address_prefixes = [ "10.10.0.0/24" ]  
}

resource "azurerm_subnet" "subnet2" {
    name = "Subnet02"
    resource_group_name = local.rg_ref_name
    virtual_network_name = local.vnet_ref_name
    address_prefixes = [ "10.10.1.0/24" ]  
}

resource "azurerm_subnet" "subnet3" {
    name = "Subnet03"
    resource_group_name = local.rg_ref_name
    virtual_network_name = local.vnet_ref_name
    address_prefixes = [ "10.10.2.0/24" ]  
}