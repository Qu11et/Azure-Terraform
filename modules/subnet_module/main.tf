resource "azurerm_subnet" "yoong-subnet-1" {
  name                 = "yoong-subnet-1"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = ["10.123.1.0/24"]
  //network_security_group_id = var.security_group_id
  }