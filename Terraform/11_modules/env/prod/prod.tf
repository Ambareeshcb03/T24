module "prod" {
    source          = "../../aks"
    rg_name         = "ProdRG"
    rg_location     = "EastUS"
    acr_name        = "nextopsprodacr24"
    acr_sku         = "Premium"
    admin_enabled   = true 
    aks_name        = "nextopsprodaks24"
    pod_cidr        = "10.4.0.0/16"
    service_cidr    = "10.5.0.0/16"
    dns_service_ip  = "10.5.0.10"
    env             = "prod"    
}