import {
  to = azurerm_resource_group.existingrg
  id = "/subscriptions/a355c32e-4a22-4b05-aab4-be236850fa6e/resourceGroups/NextOpsRG01"
}

import {
  to = azurerm_virtual_network.existingvnet
  id = "/subscriptions/a355c32e-4a22-4b05-aab4-be236850fa6e/resourceGroups/NextOpsRG01"
}

#terraform import azurerm_resource_group.existingrg /subscriptions/a355c32e-4a22-4b05-aab4-be236850fa6e/resourceGroups/NextOpsRG01