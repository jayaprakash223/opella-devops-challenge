resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.environment}-${var.location}"
  location = var.location

  tags = {
    environment = var.environment
    managed_by  = "terraform"
  }
}

module "vnet" {
  source = "../../modules/vnet"

  vnet_name          = "vnet-${var.environment}-${var.location}"
  resource_group_name = azurerm_resource_group.rg.name
  location           = azurerm_resource_group.rg.location
  address_space      = ["10.2.0.0/16"]
  subnet_name        = "snet-${var.environment}"
  subnet_prefix      = "10.2.1.0/24"
  tags = {
    environment = var.environment
    managed_by  = "terraform"
  }

  depends_on = [azurerm_resource_group.rg]
}

module "storage_account" {
  source = "../../modules/storage_account"

  storage_account_name      = var.storage_account_name
  resource_group_name       = azurerm_resource_group.rg.name
  location                  = azurerm_resource_group.rg.location
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type
  subnet_id                 = module.vnet.subnet_id

  tags = {
    environment = var.environment
    managed_by  = "terraform"
  }

  depends_on = [azurerm_resource_group.rg, module.vnet]
}
