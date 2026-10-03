module rg1 {    
  source = "../../module/resource_group"
  rg-names = var.rg-names
}

module vnet {
    depends_on = [module.rg1]
  source = "../../module/virtual_network"
  vnet = var.vnet
}

module snet {
    depends_on = [module.rg1, module.vnet]
  source = "../../module/subnet"
  subnet = var.subnet
}

module pip {
    depends_on = [module.rg1]
  source = "../../module/public_ip"
  public_ip = var.public_ip
}
module vm {
    depends_on = [module.rg1, module.vnet, module.snet]
  source = "../../module/virtual_machine"
  vms = var.vms
}

