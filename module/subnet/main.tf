resource "azurerm_subnet" "snet" {
for_each = var.subnet

  name                 = each.value.subnet-name
  resource_group_name  = each.value.resource-group-name
  virtual_network_name = each.value.virtual-network-name
  address_prefixes     = each.value.subnet-address-prefixes


}