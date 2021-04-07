provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "default" {
  name     = "${var.resource_group.name}-rg"
  location = var.resource_group.location
  tags     = var.tags
}

resource "azurerm_virtual_network" "default" {
  name                = "${azurerm_resource_group.default.name}-vnet"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  address_space       = var.virtual_network.address_space
  tags                = var.tags
}

resource "azurerm_kubernetes_cluster" "default" {
  name                    = "${var.cluster.name}-aks"
  location                = azurerm_resource_group.default.location
  resource_group_name     = azurerm_resource_group.default.name
  dns_prefix              = "${var.cluster.name}-k8s"
  private_cluster_enabled = false

  default_node_pool {
    name            = "default"
    node_count      = var.cluster.node_count
    vm_size         = var.cluster.vm_size
    os_disk_size_gb = var.cluster.os_disk_size
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control {
    enabled = true
  }

  addon_profile {
    kube_dashboard {
      enabled = true
    }
  }

  tags = var.tags
}
