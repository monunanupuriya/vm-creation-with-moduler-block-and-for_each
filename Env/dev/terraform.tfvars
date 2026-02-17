rg_name = {
  "mk-rg" = "Central India"
  "gk-rg" = "West US"
}

storage_acc = {
  "stg1" = {
    name                     = "mkstg11223344"
    location                 = "Central India"
    resource_group_name      = "mk-rg"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

vmvnet = {
  "vmnet" = {
    name                = "mkvnet"
    resource_group_name = "gk-rg"
    location            = "West US"
    address_space       = ["10.0.0.0/16"]
  }
}

mksubnet = {
  "subnet" = {
    name                 = "mksubnet"
    resource_group_name  = "gk-rg"
    virtual_network_name = "mkvnet"
    address_prefixes     = ["10.0.1.0/24"]

  }
}

vmpip = {
  "mkpip" = {
    name                = "myvmpip"
    resource_group_name = "gk-rg"
    location            = "West US"
    allocation_method   = "Static"
  }
}

nic = {

  "mknic" = {
    name                          = "mknic"
    resource_group_name           = "gk-rg"
    location                      = "West US"
    ip_name                       = "ipconfig"
    subnet_name                   = "mksubnet"
    private_ip_address_allocation = "Dynamic"
    virtual_network_name          = "mkvnet"
    resource_group_name           = "gk-rg"
  }
}

nsg = {
  "mknsg" = {
    name                 = "mknsg"
    resource_group_name  = "gk-rg"
    location             = "West US"
    subnet_name          = "mksubnet"
    virtual_network_name = "mkvnet"
    resource_group_name  = "gk-rg"
    nsg_name             = "mknsg"

  }
}

vm = {
  "mkvm" = {
    name                = "mkvm"
    resource_group_name = "gk-rg"
    location            = "West US"
    size                = "Standard_L2aos_v4"
    nic_id_name         = "mknic"

  }
}
