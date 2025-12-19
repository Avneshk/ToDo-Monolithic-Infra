module "azurerm_resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs

}

module "azurerm_vnet" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../modules/azurerm_vnet"
  networks   = var.networks

}


module "azurerm_public_ip" {
  depends_on = [module.azurerm_resource_group, module.azurerm_vnet]
  source     = "../../modules/azurerm_public_ip"
  public_ips = var.public_ips
}


module "azurerm_nic_vm" {
  depends_on = [module.azurerm_resource_group, module.azurerm_vnet, module.azurerm_public_ip]
  source     = "../../modules/azurerm_nic_vm"
  vms        = var.vms

}

module "key_vault" {
  depends_on = [module.azurerm_nic_vm, module.azurerm_resource_group, module.azurerm_vnet, module.azurerm_public_ip]

  source     = "../../modules/azurerm_key_vaults"
  key_vaults = var.key_vaults
}

