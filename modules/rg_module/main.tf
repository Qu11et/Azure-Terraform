resource "azurerm_resource_group" "yoong-rg" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    environment = "dev"
  }
}