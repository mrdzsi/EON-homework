terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "eon-rg" {
  name     = "eon-rg"
  location = "West Europe"
}

resource "azurerm_container_group" "eon-cg" {
  name                = "eon-cg"
  location            = azurerm_resource_group.eon-rg.location
  resource_group_name = azurerm_resource_group.eon-rg.name
  ip_address_type     = "Public"
  dns_name_label      = "eon-homework"
  os_type             = "Linux"

  container {
    name   = "eon-container"
    image  = "mrdzsi/eon-homework:v1.0"
    cpu    = "1"
    memory = "1"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }

  tags = {
    environment = "eon"
  }
}