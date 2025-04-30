terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.27.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "NextOpsRG01"  
    storage_account_name = "nextopssat24"                      
    container_name       = "tfstate"                       
    key                  = "terraform.tfstate"
    #access_key           = "1ESMNZs15OTApUqjzrRoW9seF6+Y2aysTeCqcyDKucIKBMiaZHruCrXF2S9O9VHXaR4WTkV6p2xV+ASt3Mk18A=="
  }
}

provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
  subscription_id = "a355c32e-4a22-4b05-aab4-be236850fa6e"
} 