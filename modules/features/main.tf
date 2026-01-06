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

resource "nxos_feature_vpc" "feature_vpc-twe-agg01" {
  provider = nxos.twe-agg01 
  admin_state = "enabled"
}
resource "nxos_feature_lacp" "feature_lacp-twe-agg01" {
  provider = nxos.twe-agg01 
  admin_state = "enabled"
}
resource "nxos_feature_bgp" "feature_bgp-twe-agg01" {
  provider = nxos.twe-agg01 
  admin_state = "enabled"
}
resource "nxos_feature_bfd" "feature_bfd-twe-agg01" {
  provider = nxos.twe-agg01 
  admin_state = "enabled"
}
resource "nxos_feature_interface_vlan" "feature_svi-twe-agg01" {
  provider = nxos.twe-agg01 
  admin_state = "enabled"
}

resource "nxos_feature_vpc" "feature_vpc-twe-agg02" {
  provider = nxos.twe-agg02 
  admin_state = "enabled"
}
resource "nxos_feature_lacp" "feature_lacp-twe-agg02" {
  provider = nxos.twe-agg02 
  admin_state = "enabled"
}
resource "nxos_feature_bgp" "feature_bgp-twe-agg02" {
  provider = nxos.twe-agg02 
  admin_state = "enabled"
}
resource "nxos_feature_bfd" "feature_bfd-twe-agg02" {
  provider = nxos.twe-agg02 
  admin_state = "enabled"
}
resource "nxos_feature_interface_vlan" "feature_svi-twe-agg02" {
  provider = nxos.twe-agg02 
  admin_state = "enabled"
}