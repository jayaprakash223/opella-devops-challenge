variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group where VNet will be created"
  type        = string
}

variable "location" {
  description = "Azure region for the VNet"
  type        = string
}

variable "address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  default     = ["10.1.0.0/16"]
}

variable "subnet_name" {
  description = "Name of the subnet to create"
  type        = string
  default     = "subnet"
}

variable "subnet_prefix" {
  description = "Address prefix for the subnet"
  type        = string
  default     = "10.1.1.0/24"
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}

