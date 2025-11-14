resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = var.tags

  # Apply network rules only when a subnet_id is provided
  dynamic "network_rules" {
    for_each = var.subnet_id != "" ? [var.subnet_id] : []
    content {
      default_action             = "Deny"
      bypass                     = ["AzureServices"]
      virtual_network_subnet_ids = [network_rules.value]
    }
  }
}
