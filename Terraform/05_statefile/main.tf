resource "azurerm_resource_group" "webrg" {
    name        = "WebRG"
    location    = "westus"
}

resource "azurerm_service_plan" "myasp" {
  name                = "NextOpsASP01"
  location            = azurerm_resource_group.webrg.location
  resource_group_name = azurerm_resource_group.webrg.name
  os_type             = "Linux"
  sku_name            = "S1"
}

resource "azurerm_linux_web_app" "myapp" {
  name                = "nextopswat24"
  location            = azurerm_resource_group.webrg.location
  resource_group_name = azurerm_resource_group.webrg.name
  service_plan_id     = azurerm_service_plan.myasp.id

  site_config {}
}
