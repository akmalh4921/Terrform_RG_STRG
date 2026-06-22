
resource "azurerm_resource_group" "rgs" {
  for_each = var.rgm
  name     = each.value.name
  location = each.value.location
}

resource "azurerm_storage_account" "stg" {
  for_each                 = var.rgm
  name                     = "strg${each.key}"
  resource_group_name      = azurerm_resource_group.rgs[each.key].name
  location                 = azurerm_resource_group.rgs[each.key].location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}