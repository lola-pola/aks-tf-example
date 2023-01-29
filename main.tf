# random uuid
resource "random_uuid" "test" {
}


# varaible "log_analytics_workspace_location"
resource "azurerm_resource_group" "elhays" {
  name     = "${var.cluster_name}"  
  location = var.resource_group_location
}

resource "azurerm_kubernetes_cluster" "elhays" {
  name                = "${var.cluster_name}"  
  dns_prefix          = "${var.cluster_name}"  
  location            = var.resource_group_location
  resource_group_name = azurerm_resource_group.elhays.name
  kubernetes_version  = var.kubernetes_version


  default_node_pool {
    name                = "${var.cluster_name}sys"
    min_count           = var.system_min_count
    max_count           = var.system_max_count
    vm_size             = var.vm_size
    enable_auto_scaling = var.enable_auto_scaling
    tags                = var.tags_map
  }

  identity {
    type = "SystemAssigned"
  }

  tags =  var.tags_map
}



resource "azurerm_kubernetes_cluster_node_pool" "elhays" {
  name                  = "${var.cluster_name}np1"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.elhays.id
  min_count             = var.min_count
  max_count             = var.max_count
  vm_size               = var.vm_size
  enable_auto_scaling   = var.enable_auto_scaling
  tags                  = var.tags_map
}

resource "azurerm_kubernetes_cluster_node_pool" "elhaysnp2" {
  name                  = "${var.cluster_name}np2"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.elhays.id
  min_count             = var.min_count
  max_count             = var.max_count
  vm_size               = var.vm_size_big
  enable_auto_scaling   = var.enable_auto_scaling
  tags                  = var.tags_map
}


resource "azurerm_kubernetes_cluster_node_pool" "elhayssp" {
  name                  = "${var.cluster_name}sp"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.elhays.id
  priority              = "Spot"
  eviction_policy       = "Delete"
  spot_max_price        = 0.5 # note: this is the "maximum" price
  min_count             = var.min_count
  max_count             = var.max_count
  vm_size               = var.vm_size_spoty
  enable_auto_scaling   = var.enable_auto_scaling
  tags                  = var.tags_map
}

resource "azurerm_kubernetes_cluster_node_pool" "labels" {
  name                  = "${var.cluster_name}l"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.elhays.id
  min_count             = var.min_count
  max_count             = var.max_count
  vm_size               = var.vm_size
  enable_auto_scaling   = var.enable_auto_scaling
  tags                  = var.tags_map
  node_labels           = {"kubernetes.azure.com/scalesetpriority" = "spot"}
}

resource "azurerm_kubernetes_cluster_node_pool" "labelstaints" {
  name                  = "${var.cluster_name}tl"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.elhays.id
  min_count             = var.min_count
  max_count             = var.max_count
  vm_size               = var.vm_size
  enable_auto_scaling   = var.enable_auto_scaling
  tags                  = var.tags_map
  node_taints           = ["kubernetes.azure.com/scalesetpriority=spot:NoSchedule"] 
}


output "client_certificate" {
  value     = azurerm_kubernetes_cluster.elhays.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.elhays.kube_config_raw

  sensitive = true
}




