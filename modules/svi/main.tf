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

##### Config #####

##### SVI Int #####

resource "nxos_svi_interface" "svi_int-agg01" {
  provider              = nxos.twe-agg01
  for_each              = {for k, v in var.svi_int_map : k => v}
  interface_id          = "${each.value.interface_id}"
  admin_state           = lookup(each.value, "admin_state", null)
  description           = lookup(each.value, "description", null)
  mtu                 = lookup(each.value, "mtu", null)
}

resource "nxos_svi_interface" "svi_int-agg02" {
  provider              = nxos.twe-agg02
  for_each              = {for k, v in var.svi_int_map : k => v}
  interface_id          = "${each.value.interface_id}"
  admin_state           = lookup(each.value, "admin_state", null)
  description           = lookup(each.value, "description", null)
  mtu                 = lookup(each.value, "mtu", null)
}

##### End of SVI Int #####

##### SVI Int vrf #####

resource "nxos_svi_interface_vrf" "svi_int_vrf-agg01" {
  provider              = nxos.twe-agg01
  for_each              = {for k, v in var.svi_int_vrf_map : k => v}
  interface_id          = "${each.value.interface_id}"
  vrf_dn                = "${each.value.vrf_dn}"
}

resource "nxos_svi_interface_vrf" "svi_int-agg02" {
  provider              = nxos.twe-agg02
  for_each              = {for k, v in var.svi_int_vrf_map : k => v}
  interface_id          = "${each.value.interface_id}"
  vrf_dn                = "${each.value.vrf_dn}"
}

##### End of SVI Int vrf #####

##### End of Config #####

##### Static config below #####

#