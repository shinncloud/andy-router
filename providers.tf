terraform {
  required_providers {
    routeros = {
      source = "terraform-routeros/routeros"
      version = "1.3.7"
    }
  }

  cloud {
    organization = "shinncloud"

    workspaces {
      name = "router"
    }
  }
}

provider "routeros" {
  hosturl        = "https://192.168.1.1:4492"
  username       = "terraform"
  insecure       = true
}
