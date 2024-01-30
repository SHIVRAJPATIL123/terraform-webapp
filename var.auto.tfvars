resource_group_name = "tfrg"

resource_group_location = "eastus2"

static_site_name = "mfstaticwebapp"

key_vault_name = "staticwebappkv"

soft_delete_retention_days = "7"

purge_protection_enabled = "false"

sku_name = "standard"

key_permissions = ["Get", "List"]

secret_permissions = ["Get", "List", "Set", "Purge", "Delete", "Recover"]

storage_permissions = ["Get", "List"]

secret_name = "deploymentkey"

