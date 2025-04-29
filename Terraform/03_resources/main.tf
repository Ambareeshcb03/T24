resource "azurerm_resource_group" "myrg" {
   name     = "DevRG"
   location = "eastus"

#    tags = {
#      env = "prod"
#    }
}

resource "azurerm_virtual_network" "myvnet" {
   name = "NextOpsDEVVNET"
   location = "eastus"
   address_space = [ "10.20.0.0/16" ]
   resource_group_name = azurerm_resource_group.myrg.name

   tags = {
     env = "prod"
   }
}