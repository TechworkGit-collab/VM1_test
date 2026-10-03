
resource azurerm_resource_group "rg1" {
 
 for_each = var.rg-names
 
 name     = each.value.rg-name
 location = each.value.rg-location

}