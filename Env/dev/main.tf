module "rg" {
  source  = "../../modules/azurerm_resource_group"
  rg_name = var.rg_name
}

module "stg" {
  depends_on  = [module.rg]
  source      = "../../modules/azurerm_storage_account"
  storage_acc = var.storage_acc
}

module "vnet" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_vnet"
  vmvnet     = var.vmvnet
}

module "mksubnet" {
  depends_on = [module.vnet, module.vnet]
  source     = "../../modules/azurerm_subnet"
  mksubnet   = var.mksubnet
}

module "vmpip" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_public_ip"
  vmpip      = var.vmpip
}

module "nic" {
  depends_on = [module.rg, module.mksubnet]
  source = "../../modules/azurerm_NIC"
  nic    = var.nic
}


module "nsg" {
  depends_on = [module.mksubnet, module.rg, module.vnet]
  source = "../../modules/azurerm_NSG"
  nsg = var.nsg
}

module "vm" {
  depends_on = [module.nic,module.mksubnet, module.nsg]
  source = "../../modules/azurerm_VM"
  vm =var.vm
}