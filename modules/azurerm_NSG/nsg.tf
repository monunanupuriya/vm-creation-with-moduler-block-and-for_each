resource "azurerm_network_security_group" "nsg" {
  for_each            = var.nsg
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"

  }

}

variable "nsg" {}


resource "azurerm_subnet_network_security_group_association" "nsgas" {
  for_each                  = var.nsg
  subnet_id                 = data.azurerm_subnet.subnet_id[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg_id[each.key].id
}


data "azurerm_subnet" "subnet_id" {
  for_each             = var.nsg
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_network_security_group" "nsg_id" {
  for_each            = var.nsg
  name                = each.value.nsg_name
  resource_group_name = each.value.resource_group_name
}
