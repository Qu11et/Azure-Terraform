variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
}

variable "network_interface_id" {
  description = "ID of the network interface to which the public IP will be associated"
  type        = string
}

variable "ssh_public_key" {
  description = "SSH public key used to login to the VM"
  type        = string
}

