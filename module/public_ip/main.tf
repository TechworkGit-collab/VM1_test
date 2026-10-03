
 

resource "azurerm_public_ip" "pip" {
    for_each = var.public_ip
  name                = each.value.pip_name
  resource_group_name = each.value.pip_rg_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method

  
}