terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.27.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "NextOps"  
    storage_account_name = "nextopssat23"                      
    container_name       = "workspaces"                       
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
  subscription_id = "a355c32e-4a22-4b05-aab4-be236850fa6e"
} 