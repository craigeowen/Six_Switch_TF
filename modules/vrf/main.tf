terraform {
  required_providers {
    nxos = {
      source = "CiscoDevNet/nxos"
    }
  }
}

provider "nxos" {
  alias = "twe-agg01"
  username = var.provider-username
  password = var.provider-userpass
  url      = var.provider-url-agg01
}
provider "nxos" {
  alias = "twe-agg02"
  username = var.provider-username
  password = var.provider-userpass
  url      = var.provider-url-agg02
}


resource "nxos_vrf" "vrf-twe-agg01" {
  provider = nxos.twe-agg01 
  for_each = toset(var.vrf-names)
  name = each.value
}


resource "nxos_vrf" "vrf-twe-agg02" {
  provider = nxos.twe-agg02
  for_each = toset(var.vrf-names)
  name = each.value
}

