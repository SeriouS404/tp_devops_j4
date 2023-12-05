variable "resource_group_name" {
  description = "Nom du groupe de ressources"
  type        = string
  default     = "example-resource-group"
}

variable "location" {
  description = "Emplacement des ressources"
  type        = string
  default     = "WestEurope"
}

variable "virtual_network_name" {
  description = "Nom du réseau virtuel"
  type        = string
  default     = "example-network"
}

variable "virtual_network_address_space" {
  description = "Espace d'adressage du réseau virtuel"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "Nom du sous-réseau"
  type        = string
  default     = "example-subnet"
}

variable "subnet_address_prefix" {
  description = "Préfixe d'adresse du sous-réseau"
  type        = string
  default     = "10.0.1.0/24"
}
