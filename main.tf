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

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_container_group" "example" {
  name                = "example-continst"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  ip_address_type     = "Public"
  dns_name_label      = "aci-label-example"
  os_type             = "Linux"

  container {
    name   = "eon-homework"
    image  = "mrdzsi/eon-homework:v0.0"
    cpu    = "1"
    memory = "1"

    ports {
      port     = 443
      protocol = "TCP"
    }
  }

  tags = {
    environment = "testing"
  }
}