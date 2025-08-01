variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
}

variable "public_ip_name" {
  description = "Name of the public IP address"
  type        = string
}