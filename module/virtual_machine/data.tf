data "azurerm_subnet" "subnet" {
  for_each = var.vms

  name                 = each.value.subnet-name
  virtual_network_name = each.value.virtual-network-name
  resource_group_name  = each.value.resource-group-name

}

