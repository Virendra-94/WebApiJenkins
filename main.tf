terraform {
  backend "azurerm" {
    resource_group_name   = "terraform-rg-vir"
    storage_account_name  = "terraformstoragevir1"
    container_name        = "terraformstate"
    key                   = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East US"
}
