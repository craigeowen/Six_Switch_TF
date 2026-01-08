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

##### loopback IPv4 Int Address #####
# AGG01
resource "nxos_ipv4_interface" "ipv4-int-lo101-agg01" {
  provider     = nxos.twe-agg01
  for_each     = {for k, v in var.ipv4_int_map-agg01 : k => v}
  vrf          = "${each.value.vrf}"
  interface_id = "${each.value.interface_id}"
}

resource "nxos_ipv4_interface_address" "int-lo101-ipv4-address-agg01" {
  provider       = nxos.twe-agg01
  for_each       = {for k, v in var.ipv4_int_address_map-agg01 : k => v}
  vrf            = "${each.value.vrf}"
  interface_id   = "${each.value.interface_id}"
  address        = "${each.value.address}"
}

#AGG02
resource "nxos_ipv4_interface" "ipv4-int-lo101-agg02" {
  provider     = nxos.twe-agg02
  for_each     = {for k, v in var.ipv4_int_map-agg02 : k => v}
  vrf          = "${each.value.vrf}"
  interface_id = "${each.value.interface_id}"
}

resource "nxos_ipv4_interface_address" "int-lo101-ipv4-address-agg02" {
  provider       = nxos.twe-agg02
  for_each       = {for k, v in var.ipv4_int_address_map-agg02 : k => v}
  vrf            = "${each.value.vrf}"
  interface_id   = "${each.value.interface_id}"
  address        = "${each.value.address}"
}

##### End of loopback IPv4 Int Address #####



##### End of Config #####

##### Static config below #####

