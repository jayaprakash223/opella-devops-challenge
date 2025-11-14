terraform {
  backend "azurerm" {
    resource_group_name  = "Terraform"
    storage_account_name = "terraformstateeus"
    container_name       = "tfstate"
    key                  = "prod-vnet.tfstate"
  }
}
