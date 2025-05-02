variable "rg_name" {
    type = string
    description = "This variable is to define Resource Group name"
}

variable "rg_location" {
    type = string
}

variable "vnet_name" {
    type = string
}

variable "vnet_addressspace" {
    type = list(string)
}

variable "subnet1_name" {
    type = string
}

variable "subnet2_name" {
    type = string
}

variable "subnet3_name" {
    type = string
}

variable "nic_name" {
    type = string 
}

variable "vm_name" {
    type = string
}

variable "vm_size" {
    type = string
}