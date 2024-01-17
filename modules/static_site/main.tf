resource "azurerm_static_site" "example" {
  name                     = var.static_site_name
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
}