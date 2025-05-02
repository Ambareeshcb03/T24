# if you want to work production env then type yes when prompted while executing
resource "azurerm_resource_group" "rg1" {
    name      = var.env_prod == "yes" ? "prod-rg" : "dev-rg"
    location  = var.env_prod == "yes" ? "eastus" : "westus"
}

resource "azurerm_virtual_network" "vnet" {
    name                        = var.env_prod == "yes" ? "prod-vnet" : "dev-vnet" 
    resource_group_name         = azurerm_resource_group.rg1.name
    location                    = azurerm_resource_group.rg1.location
    address_space               = var.env_prod == "yes" ? ["10.20.0.0/16"] : ["10.30.0.0/16"]  
}