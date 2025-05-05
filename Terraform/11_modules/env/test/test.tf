module "test" {
    source          = "../../aks"
    rg_name         = "TestRG"
    rg_location     = "EastUS"
    acr_name        = "nextopstestacr24"
    acr_sku         = "Basic"
    admin_enabled   = true 
    aks_name        = "nextopstestaks24"
    pod_cidr        = "10.6.0.0/16"
    service_cidr    = "10.7.0.0/16"
    dns_service_ip  = "10.7.0.10"
    env             = "test"    
}