terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 3.0"
     }
  }
    backend "azurerm" {
      resource_group_name = "tf-backend"
      storage_account_name = "tfazcodebackup"
      container_name = "tf-backend"
      key = "tf-backend"
  
      }
}
provider "azurerm" {
  features {}

}