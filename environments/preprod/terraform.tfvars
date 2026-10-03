rg-names= {
    rg1 = {
        rg-name     = "rg-rahat"
        rg-location = "eastus"
    }
    rg2 = {
        rg-name     = "rg-mirza"
        rg-location = "eastus"
    }
}


vnet = {
    vnet1 = {
        vnet-name        = "rahat-vnet"
        address-space    = ["10.0.0.0/16"]
        location         = "eastus"
        rg-name          = "rg-rahat"
    }
}

subnet = {
    subnet1 = {
        subnet-name             = "frontend-subnet"
        resource-group-name     = "rg-rahat"
        virtual-network-name    = "rahat-vnet"
        subnet-address-prefixes = ["10.0.1.0/24"]
    }
    subnet2 = {
        subnet-name             = "backend-subnet"
        resource-group-name     = "rg-rahat"
        virtual-network-name    = "rahat-vnet"
        subnet-address-prefixes = ["10.0.2.0/24"]
    }
    subnet3 = {
        subnet-name             = "database-subnet"
        resource-group-name     = "rg-rahat"
        virtual-network-name    = "rahat-vnet"
        subnet-address-prefixes = ["10.0.3.0/24"]
    }
}
public_ip = {
    pip1 = {
        pip_name           = "frontend-pip"
        pip_rg_name        = "rg-rahat"
        location           = "eastus"
        allocation_method  = "Static"
    }
    pip2 = {
        pip_name           = "backend-pip"
        pip_rg_name        = "rg-rahat"
        location           = "eastus"
        allocation_method  = "Static"
    }
    pip3 = {
        pip_name           = "database-pip"
        pip_rg_name        = "rg-rahat"
        location           = "eastus"
        allocation_method  = "Static"
    }
}
vms = {
  vm1 = {
    vm-name             = "frontend-vm"
    resource-group-name = "rg-rahat"
    location            = "eastus"
    subnet-name         = "frontend-subnet"
    nic-name            = "frontend-nic"
    virtual-network-name = "rahat-vnet"
    vm-size             = "Standard_D2ads_v7"
    admin-username      = "azureadmin"
    admin-password      = "YourStrongPassword123"
    nsg-name            = "frontend-nsg"
    public_ip_name     = "frontend-pip"
  }

  vm2 = {
    vm-name             = "backend-vm"
    resource-group-name = "rg-rahat"
    location            = "eastus"
    subnet-name         = "backend-subnet"
    nic-name            = "backend-nic"
    virtual-network-name = "rahat-vnet"
    vm-size             = "Standard_D2ads_v7"
    admin-username      = "azureadmin"
    admin-password      = "YourStrongPassword123"
    nsg-name            = "backend-nsg"
    public_ip_name     = "backend-pip"
  }
    vm3 = {
        vm-name             = "database-vm"
        resource-group-name = "rg-rahat"
        location            = "eastus"
        subnet-name         = "database-subnet"
        nic-name            = "database-nic"
        virtual-network-name = "rahat-vnet"
        vm-size             = "Standard_D2ads_v7"
        admin-username      = "azureadmin"
        admin-password      = "YourStrongPassword123"
        nsg-name            = "database-nsg"
        public_ip_name     = "database-pip"
    }
}
