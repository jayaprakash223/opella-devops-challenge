resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.environment}-${var.location}"
  location = var.location

  tags = {
    environment = var.environment
    managed_by  = "terraform"
  }
}

module "storage_account" {
  source = "../../modules/storage_account"

  storage_account_name      = var.storage_account_name
  resource_group_name       = azurerm_resource_group.rg.name
  location                  = azurerm_resource_group.rg.location
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type

  tags = {
    environment = var.environment
    managed_by  = "terraform"
  }

  depends_on = [azurerm_resource_group.rg]
}

