resource "azurerm_resource_group" "rg1" {
    name  =  "cbdrg01"
    location = "eastus"  

    lifecycle {
      create_before_destroy = true
    }
}