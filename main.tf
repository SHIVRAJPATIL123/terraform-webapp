module "RG" {
  source                  = "./modules/RG"
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
}

module "static_site" {
  source                  = "./modules/static_site"
  static_site_name        = var.static_site_name
  resource_group_name     = module.RG.resource_group_name
  resource_group_location = module.RG.resource_group_location
}

module "key_vault" {
  source                     = "./modules/key_vault"
  key_vault_name             = var.key_vault_name
  key_vault_location         = module.RG.resource_group_location
  resource_group_name        = module.RG.resource_group_name
  soft_delete_retention_days = var.soft_delete_retention_days
  purge_protection_enabled   = var.purge_protection_enabled
  sku_name                   = var.sku_name
  key_permissions            = var.key_permissions
  secret_permissions         = var.secret_permissions
  storage_permissions        = var.storage_permissions
  secret_name                = var.secret_name
  secret_value               = module.static_site.api_key
}