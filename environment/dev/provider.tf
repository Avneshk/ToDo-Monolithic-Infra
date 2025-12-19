terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.52.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "RG-Avnesh12"
    storage_account_name = "avneshst"
    container_name       = "avneshct"
    key                  = "terraform.tfstate"
  }

}



provider "azurerm" {
  features {}
  subscription_id = "a201d6ce-420d-42ed-93d7-34c69de03add"
}