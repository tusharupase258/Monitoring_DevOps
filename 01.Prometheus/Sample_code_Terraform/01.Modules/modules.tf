module "tusharRGM" {
  source       = "../02.RG"
  tusharRGvars = var.tusharRGvarsm
}

module "tusharVnetsM" {
  depends_on     = [module.tusharRGM]
  source         = "../03.Vnet"
  tusharvnetsvar = var.tusharvnetvarsm
}

module "tusharsubnetSM" {
  depends_on       = [module.tusharVnetsM]
  source           = "../04.Subnet"
  tusharsubnetsvar = var.tusharsubnetmvars
}

module "tusharpublicsm" {
  depends_on   = [module.tusharRGM,module.tusharsubnetSM]
  source       = "../05.Public_Ip"
  tusharipsvar = var.tusharpublicipsvarm
}

module "tusharnicsm" {
  depends_on         = [module.tusharpublicsm, module.tusharVnetsM, module.tusharsubnetSM]
  source             = "../06.NIC"
  tusharnicsvars     = var.tusharnicsvarsm
  tusharsubnetsvar   = var.tusharsubnetmvars
  tusharpublicipdata = var.tusharpublicipsvarm
}

module "tusharkeyvaultsm" {
  depends_on          = [module.tusharRGM]
  source              = "../07.KeyVault"
  tusharkeyvaultsvars = var.tusharkeyvaultsvarsm
}

module "tusharkvsecretsm" {
  depends_on          = [module.tusharkeyvaultsm]
  source              = "../08.username&passwd for vm"
  tusharkeyvaultsvars = var.tusharkeyvaultsvarsm
  tusharpasswdsvars   = var.tusharpasswdsvarsm
}

module "tusharvmm" {
  depends_on          = [module.tusharnicsm, module.tusharkvsecretsm]
  source              = "../09.VM"
  tusharkeyvaultsvars = var.tusharkeyvaultsvarsm
  tusharpasswdsvars   = var.tusharpasswdsvarsm
  tusharnicsvars      = var.tusharnicsvarsm
  tusharlinuxvmsvar   = var.tusharvmsvarsm
}