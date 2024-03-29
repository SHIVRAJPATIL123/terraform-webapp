
data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "example" {
  name                        = var.key_vault_name
  location                    = var.key_vault_location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = var.soft_delete_retention_days
  purge_protection_enabled    = var.purge_protection_enabled

  sku_name = var.sku_name

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = var.key_permissions

    secret_permissions = var.secret_permissions

    storage_permissions = var.storage_permissions
  }
}

resource "azurerm_key_vault_secret" "example" {
  name         = var.secret_name
  value        = var.secret_value
  key_vault_id = azurerm_key_vault.example.id
}
