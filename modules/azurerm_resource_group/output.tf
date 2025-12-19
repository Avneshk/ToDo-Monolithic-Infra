# output "rg_ids" {
#     value = {for k, rg in azurerm_resource_group.RG : k => rg.id}
  
# }


output "rg_ids" {
  value = { for k, rg in azurerm_resource_group.rg : k => rg.id }
}

