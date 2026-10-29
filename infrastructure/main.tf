terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "de_resources" {
  name     = "de_resources"
  location = var.az_region
}

resource "azurerm_virtual_network" "primary_network" {
  name                = "primary_network"
  resource_group_name = azurerm_resource_group.de_resources.name
  location            = azurerm_resource_group.de_resources.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "primary_subnet" {
  name                 = "storage-subnet"
  resource_group_name  = azurerm_resource_group.de_resources.name
  virtual_network_name = azurerm_virtual_network.primary_network.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_storage_account" "data_lake" {
  name                     = var.bucket_name
  resource_group_name      = azurerm_resource_group.de_resources.name
  location                 = azurerm_resource_group.de_resources.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = true

  blob_properties {
    change_feed_enabled = true
    delete_retention_policy {
      days = 7
    }
    container_delete_retention_policy {
      days = 7
    }
  }

  allow_nested_items_to_be_public = false
}

resource "azurerm_storage_data_lake_gen2_filesystem" "raw" {
  name               = var.dataset_name
  storage_account_id = azurerm_storage_account.data_lake.id
}
