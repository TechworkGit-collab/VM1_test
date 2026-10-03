
resource "azurerm_virtual_network" "vnet" {

    for_each = var.vnet

  name                = each.value.vnet-name
  address_space       = each.value.address-space
  location            = each.value.location
  resource_group_name = each.value.rg-name
}