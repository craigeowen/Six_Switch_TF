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

##### ACL#####

resource "nxos_ipv4_access_list" "acl-50-agg01" {
  provider = nxos.twe-agg01 
  for_each = {for k, v in var.acl-map : k => v}
  name     = "${each.value.name}"
}

resource "nxos_ipv4_access_list" "acl-50-agg02" {
  provider = nxos.twe-agg02
  for_each = {for k, v in var.acl-map : k => v}
  name     = "${each.value.name}"
}

##### End of ACL #####



##### End of SVI Int vrf #####

##### End of Config #####

##### Static config below #####

#