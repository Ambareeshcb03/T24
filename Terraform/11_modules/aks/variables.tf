variable "rg_name" {
   type = string 
}

variable "rg_location" {
    type = string 
}

variable "acr_name" {
    type = string 
}

variable "acr_sku" {
    type = string 
}

variable "admin_enabled" {
    type = bool
}

variable "aks_name" {
    type = string 
}

variable "pod_cidr" {
    type = string 
}

variable "dns_service_ip" {
    type = string 
}

variable "service_cidr" {
    type = string 
}

variable "env" {
    type = string
}