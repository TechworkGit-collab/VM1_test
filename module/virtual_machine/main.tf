
# data "azurerm_subnet" "subnet" {
#     for_each = var.vms
#   name                 = each.value.subnet-name
#   virtual_network_name = each.value.virtual-network-name
#   resource_group_name  = each.value.resource-group-name
# }

resource "azurerm_network_interface" "nic" {

    for_each = var.vms
  name                = each.value.nic-name
  location            = each.value.location
  resource_group_name = each.value.resource-group-name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_public_ip" "pip" {
  for_each            = var.nic
  name                = each.value.public_ip_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  allocation_method   = "SRahat@2611tatic"
  sku                 = "Standard"

}

resource "azurerm_linux_virtual_machine" "vm" {
  
  for_each = var.vms
  
  name                = each.value.vm-name
  resource_group_name = each.value.resource-group-name
  location            = each.value.location
  size                = each.value.vm-size
  admin_username      = each.value.admin-username
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id
  ]

  disable_password_authentication = false
  admin_password = each.value.admin-password

#   admin_ssh_key {
#     username   = "adminuser"
#     public_key = file("~/.ssh/id_rsa.pub")
#   }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku        = "22_04-lts-gen2"
      version    = "latest"
}
}

resource "azurerm_network_security_group" "nsgs" {

    for_each = var.vms
  name                = each.value.nsg-name
  location            = each.value.location
  resource_group_name = each.value.resource-group-name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}

resource "azurerm_network_interface_security_group_association" "nsg_assn" {
    for_each = var.vms
  network_interface_id      = azurerm_network_interface.nic[each.key].id
  network_security_group_id = azurerm_network_security_group.nsgs[each.key].id
}

