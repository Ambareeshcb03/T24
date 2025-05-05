resource "azurerm_resource_group" "rgname" {
  name     = "nextopsrg15"
  location = "WestUS"

#   lifecycle {
#     prevent_destroy = true
#   }
}

resource "azurerm_virtual_network" "nextopsvnet04" {
  name                  = "NextOpsVNET07"
  resource_group_name   = azurerm_resource_group.rgname.name
  location              = azurerm_resource_group.rgname.location
  address_space         = ["10.5.0.0/16"] 

  tags = {
    env = "dev"
    createdBy = "Charan"
    creationDate = "050525"   
  }

   lifecycle {
    ignore_changes = [ tags ]
  }

}