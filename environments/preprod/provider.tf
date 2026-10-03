terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.4.0"
    }
  }
}

provider "azurerm" {

 features {}
 subscription_id = "6670366d-32db-4180-a842-1ce1053317b7" 
 
}

