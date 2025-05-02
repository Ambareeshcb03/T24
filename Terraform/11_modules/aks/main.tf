resource "azurerm_resource_group" "aksrg" {
  name     = var.rg_name
  location = var.rg_location
}

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.aksrg.name
  location            = azurerm_resource_group.aksrg.location
  sku                 = var.acr_sku   # prod=premium, dev=standard, test=basic
  admin_enabled       = var.admin_enabled # prod=disabled, dev=enabled, test=enabled
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  resource_group_name = azurerm_resource_group.aksrg.name
  location            = azurerm_resource_group.aksrg.location
  dns_prefix          = "nextops"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
    auto_scaling_enabled = "true"
    min_count = "1"
    max_count = "3"
  }

  network_profile {
    network_plugin      = "azure"
    network_plugin_mode = "overlay"
    pod_cidr            = var.pod_cidr
    dns_service_ip      = var.dns_service_ip
    network_policy      = "calico"
    load_balancer_sku   = "standard"
    service_cidr        = var.service_cidr
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = var.env
  }
}

resource "azurerm_role_assignment" "aks2acr" {
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}