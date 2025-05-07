resourcedetails = {
  "eastus" = {
      rg_name           = "eastRG" 
      rg_location       = "eastus"
      vnet_name         = "eastVnet"
      address_space     = [ "10.20.0.0/16" ]
      subnet_name       = "eastsubnet"
      address_prefix    = [ "10.20.0.0/24" ]
      vm_name           = "eastVM"
      vm_size           = "Standard_B1s"
  }
  "westus" = {
      rg_name           = "westRG"            #<--- each.value.keyname 
      rg_location       = "westus"
      vnet_name         = "westVnet"
      address_space     = [ "10.30.0.0/16" ]
      subnet_name       = "westsubnet"
      address_prefix    = [ "10.30.0.0/24" ]
      vm_name           = "westVM"
      vm_size           = "Standard_B2s"
  }
}