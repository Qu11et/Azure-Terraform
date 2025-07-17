module "rg_module" {
  source   = "../../modules/rg_module"
  resource_group_name     = var.resource_group_name
  location = var.location
}

module "vn_module" {
  source               = "../../modules/vn_module"
  resource_group_name  = var.resource_group_name
  location             = var.location
  address_space        = ["10.121.0.0/16"]
  virtual_network_name = var.virtual_network_name
}

module "subnet_module" {
  source               = "../../modules/subnet_module"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  subnet_name          = "dev-subnet-1" 
  address_prefixes     = ["10.121.1.0/24"]
  //security_group_id   = module.sg_module.security_group_id
}

module "sg_module" {
  source                     = "../../modules/sg_module"
  resource_group_name        = var.resource_group_name
  location                   = var.location
  subnet_id                  = module.subnet_module.subnet_id
  security_group_name        = "dev-security-group"
  security_group_rule_name = "yoong-dev-rule-1"
  priority                   = 100
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "*"
  source_port_range          = "*"
  destination_port_range     = "*"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
}

module "pubip_module" {
  source              = "../../modules/pubip_module"
  resource_group_name = var.resource_group_name
  location            = var.location
  public_ip_name      = "dev-public-ip"
}

module "nic_module" {
  source              = "../../modules/nic_module"
  network_interface_name                = "dev-nic"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = module.subnet_module.subnet_id
  public_ip_id        = module.pubip_module.public_ip_id
}

module "vm_module" {
  source               = "../../modules/vm_module"
  resource_group_name  = var.resource_group_name
  location             = var.location
  network_interface_id = module.nic_module.network_interface_id
  ssh_public_key       = var.ssh_public_key
  vm_name              = "dev-vm"
  vm_size              = "Standard_B1s"
  admin_username       = "adminuser"
  storage_account_type = "Standard_LRS"
  publisher            = "Canonical"
  offer                = "0001-com-ubuntu-server-jammy"
  sku                  = "22_04-lts"
}