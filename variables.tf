# varaible "name" 
variable "name" {
  type    = string
  default = "elhays"
}



# tags map
variable "tags_map" {
  type = map(string)
  default = {
    env          = "Production",
    elhay        = "test",
    upgrade      = "test",
    version      = "1.25.4",
    last_version = "1.19.07"
    ManagedBy    = "Terraform"
  }
}


variable "node_labels" {
  type    = map(string)
  default = { "test" = "test" }
}

variable "node_taints" {
  type    = set(string)
  default = ["kubernetes.azure.com/test=test:NoSchedule"]
}

# The following two variable declarations are placeholder references.
# Set the values for these variable in terraform.tfvars
variable "aks_service_principal_app_id" {
  default = ""
}

variable "enable_auto_scaling" {
  default = true
}

variable "vm_size" {
  default = "Standard_D2_v2"
}


variable "vm_size_spoty" {
  default = "Standard_D2s_v3"
}

variable "vm_size_big" {
  default = "Standard_D2_v3"
}
variable "max_count" {
  default = 15
}

variable "min_count" {
  default = 0
}

variable "system_min_count" {
  default = 1
}

variable "system_max_count" {
  default = 15
}

variable "aks_service_principal_client_secret" {
  default = ""
}

variable "cluster_name" {
  default = "elhaysk8s"
}

variable "dns_prefix" {
  default = "elhaysk8s"
}

# Refer to https://azure.microsoft.com/global-infrastructure/services/?products=monitor for available Log Analytics regions.
variable "log_analytics_workspace_location" {
  default = "West Europe"
}

variable "log_analytics_workspace_name" {
  default = "testLogAnalyticsWorkspaceName"
}

# Refer to https://azure.microsoft.com/pricing/details/monitor/ for Log Analytics pricing
variable "log_analytics_workspace_sku" {
  default = "PerGB2018"
}

variable "resource_group_location" {
  default     = "West Europe"
  description = "Location of the resource group."
}

variable "resource_group_name_prefix" {
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "kubernetes_version" {
  default = "1.25.4"
  # default     = "1.24.6"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}


