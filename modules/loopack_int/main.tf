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

##### loopback Int #####

resource "nxos_loopback_interface" "loopback_int-agg01" {
  provider              = nxos.twe-agg01
  for_each              = {for k, v in var.loopback_map : k => v}
  interface_id          = "${each.value.interface_id}"
  admin_state           = "${each.value.admin_state}"
  description           = "${each.value.description}"
}


resource "nxos_loopback_interface" "loopback_int-agg02" {
  provider              = nxos.twe-agg02
  for_each              = {for k, v in var.loopback_map : k => v}
  interface_id          = "${each.value.interface_id}"
  admin_state           = "${each.value.admin_state}"
  description           = "${each.value.description}"
}

##### End of Loopback Int #####

##### loopback Int VRF #####

resource "nxos_loopback_interface_vrf" "loopback_int_vrf-agg01" {
  provider              = nxos.twe-agg01
  for_each              = {for k, v in var.loopback-vrf_map : k => v}
  interface_id          = "${each.value.interface_id}"
  vrf_dn                = "${each.value.vrf_dn}"
}


resource "nxos_loopback_interface_vrf" "loopback_int_vrf-agg02" {
  provider              = nxos.twe-agg02
  for_each              = {for k, v in var.loopback-vrf_map : k => v}
  interface_id          = "${each.value.interface_id}"
  vrf_dn                = "${each.value.vrf_dn}"
}

##### End of Loopback Int VRF #####

##### End of Config #####

##### Static config below #####

