tusharRGvarsm = {
  tusharAnsibleRG = {
    name     = "tusharAnsibleRG"
    location = "France Central"
  }
}

tusharvnetvarsm = {
  tusharvnet1 = {
    name                = "tusharansiblevnet1"
    location            = "France Central"
    resource_group_name = "tusharAnsibleRG"
    address_space       = ["10.1.0.0/16"]
  }
}

tusharsubnetmvars = {
  tusharansiblesubnet1 = {
    name                 = "tusharansiblesubnet1"
    location             = "France Central"
    resource_group_name  = "tusharAnsibleRG"
    address_prefixes     = ["10.1.1.0/24"]
    virtual_network_name = "tusharansiblevnet1"
  }
  tusharansiblesubnet2 = {
    name                 = "tusharansiblesubnet2"
    location             = "France Central"
    resource_group_name  = "tusharAnsibleRG"
    address_prefixes     = ["10.1.2.0/24"]
    virtual_network_name = "tusharansiblevnet1"
  }
  CentralMonitoringvmsubnet = {
    name                 = "CentralMonitoringvmsubnet"
    location             = "France Central"
    resource_group_name  = "tusharAnsibleRG"
    address_prefixes     = ["10.1.3.0/24"]
    virtual_network_name = "tusharansiblevnet1"
  }
}



tusharpublicipsvarm = {
  tusharpublic1 = {
    name                = "tusharpublic1"
    location            = "France Central"
    resource_group_name = "tusharAnsibleRG"
    allocation_method   = "Static"
  }
  tusharpublic2 = {
    name                = "tusharpublic2"
    location            = "France Central"
    resource_group_name = "tusharAnsibleRG"
    allocation_method   = "Static"
  }
  CentralMonitoringpublicip = {
    name                = "CentralMonitoringpublicip"
    location            = "France Central"
    resource_group_name = "tusharAnsibleRG"
    allocation_method   = "Static"
  }
}

tusharnicsvarsm = {
  tusharansiblenic1 = {
    name                          = "tusharansiblenic1"
    location                      = "France Central"
    resource_group_name           = "tusharAnsibleRG"
    ip_configuration_name         = "tusharipconfig1"
    private_ip_address_allocation = "Dynamic"
    subnet_name                   = "tusharansiblesubnet1"
    public_ip                     = "tusharpublic1"
  }
  tusharansiblenic2 = {
    name                          = "tusharansiblenic2"
    location                      = "France Central"
    resource_group_name           = "tusharAnsibleRG"
    ip_configuration_name         = "tusharipconfig2"
    private_ip_address_allocation = "Dynamic"
    subnet_name                   = "tusharansiblesubnet2"
    public_ip                     = "tusharpublic2"
  }
  CentralMonitoringnic = {
    name                          = "CentralMonitoringnic"
    location                      = "France Central"
    resource_group_name           = "tusharAnsibleRG"
    ip_configuration_name         = "tusharipconfig3"
    private_ip_address_allocation = "Dynamic"
    subnet_name                   = "CentralMonitoringvmsubnet"
    public_ip                     = "CentralMonitoringpublicip"
  }

}

tusharkeyvaultsvarsm = {
  tusharkeyvault1 = {
    name                = "tusharkeyvault1"
    resource_group_name = "tusharAnsibleRG"
    location            = "France Central"
    sku_name            = "standard"

  }
}

tusharpasswdsvarsm = {
  tusharansiblevm1 = {
    name             = "tusharansiblevm1"
    length           = 16
    special          = true
    override_special = "!#$%&*()-_=+[]{}<>:?"
    key_vault        = "tusharkeyvault1"
  }
  tusharansiblevm2 = {
    name             = "tusharansiblevm2"
    length           = 14
    override_special = "!#$%&*()-_=+[]{}<>:?"
    special          = true
    key_vault        = "tusharkeyvault1"
  }
  CentralMonitoringvm = {
    name             = "CentralMonitoringvm"
    length           = 14
    override_special = "!#$%&*()-_=+[]{}<>:?"
    special          = true
    key_vault        = "tusharkeyvault1"
  }
}

tusharvmsvarsm = {
  tusharansiblevm1 = {
    name                = "tusharansiblevm1"
    resource_group_name = "tusharAnsibleRG"
    location            = "France Central"
    size                = "Standard_DS1_v2"
    nic                 = "tusharansiblenic1"
  }
  tusharansiblevm2 = {
    name                = "tusharansiblevm2"
    resource_group_name = "tusharAnsibleRG"
    location            = "France Central"
    size                = "Standard_DS1_v2"
    nic                 = "tusharansiblenic2"
  }
  CentralMonitoringvm = {
    name                = "CentralMonitoringvm"
    resource_group_name = "tusharAnsibleRG"
    location            = "France Central"
    size                = "Standard_F2"
    nic                 = "CentralMonitoringnic"
  }

}