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


resource "nxos_bridge_domain" "vlan-agg01" {
  provider = nxos.twe-agg01
  for_each = {for k, v in var.vlan_map : k => v}
  fabric_encap = "vlan-${each.value.fabric_encap}"
  name         = "${each.value.name}"
}


resource "nxos_bridge_domain" "vlan-agg02" {
  provider = nxos.twe-agg02
  for_each = {for k, v in var.vlan_map : k => v}
  fabric_encap = "vlan-${each.value.fabric_encap}"
  name         = "${each.value.name}"
}

