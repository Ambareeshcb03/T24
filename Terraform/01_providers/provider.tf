terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.27.0"
    }
  }
}

provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
  
  client_id         = "fkjdakkladnckadkcdakcsdksd0"
  client_secret     = "fkjdakkladnckadkcdakcsdksd0"
  tenant_id         = "fkjdakkladnckadkcdakcsdksd0"
  subscription_id   = "fkjdakkladnckadkcdakcsdksd0"

}