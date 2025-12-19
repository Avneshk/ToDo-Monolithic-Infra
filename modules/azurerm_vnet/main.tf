resource "azurerm_virtual_network" "vnet" {
  for_each            = var.networks
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_prefixes

  dynamic "subnet" {
    for_each = lookup(each.value, "subnet", {})
    content {
      name             = subnet.value.name
      address_prefixes = subnet.value.address_prefixes
    }

  }
}


