resource "azurerm_resource_group" "example_azurerm_resource_group" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "example_virtual_network" {
  name                = "var.virtual_network_name"
  resource_group_name = azurerm_resource_group.example_azurerm_resource_group.name
  location            = azurerm_resource_group.example_azurerm_resource_group.location
  address_space       = var.virtual_network_address_space
  subnet {
    name           = "example-subnet"
    address_prefix = var.subnet_address_prefix
  }
}
resource "azurerm_kubernetes_cluster" "aks"{
  name = "aks"
  location = azurerm_resource_group.example_azurerm_resource_group.location
  resource_group_name = azurerm_resource_group.example_azurerm_resource_group.name
  dns_prefix = "exampleaks1"

  default_node_pool{
    name = "default"
    node_count = 1
    vm_size = "Standard_D2_v2"
  }

  identity{
    type = "SystemAssigned"
  }
}
resource "local_file" "kube_config"{
  content = azurerm_kubernetes_cluster.aks.kube_config_raw
  filename = ".kube/config"
}
