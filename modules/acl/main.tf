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

resource "nxos_ipv4_access_list" "acl-agg01" {
  provider = nxos.twe-agg01 
  for_each = {for k, v in var.acl-map : k => v}
  name     = "${each.value.name}"
}

resource "nxos_ipv4_access_list" "acl-agg02" {
  provider = nxos.twe-agg02
  for_each = {for k, v in var.acl-map : k => v}
  name     = "${each.value.name}"
}

resource "nxos_ipv4_access_list_entry" "acl-entry-agg01" {
  provider                  = nxos.twe-agg01
  for_each                  = {for k, v in var.acl-entry-map : k => v}
  name                      = "${each.value.name}"
  sequence_number           = "${each.value.sequence_number}"
  action                    = "${each.value.action}"
  destination_prefix        = "${each.value.destination_prefix}"
  destination_prefix_length = "${each.value.destination_prefix_length}"
  destination_prefix_mask   = "${each.value.destination_prefix_mask}"
  protocol                  = "${each.value.protocol}"
  source_prefix             = "${each.value.source_prefix}"
  source_prefix_length      = "${each.value.source_prefix_length}"
  source_prefix_mask        = "${each.value.source_prefix_mask}"
  remark                    = "${each.value.remark}"
}

resource "nxos_ipv4_access_list_entry" "acl-entry-agg02" {
  provider                  = nxos.twe-agg02
  for_each                  = {for k, v in var.acl-entry-map : k => v}
  name                      = "${each.value.name}"
  sequence_number           = "${each.value.sequence_number}"
  action                    = "${each.value.action}"
  destination_prefix        = "${each.value.destination_prefix}"
  destination_prefix_length = "${each.value.destination_prefix_length}"
  destination_prefix_mask   = "${each.value.destination_prefix_mask}"
  protocol                  = "${each.value.protocol}"
  source_prefix             = "${each.value.source_prefix}"
  source_prefix_length      = "${each.value.source_prefix_length}"
  source_prefix_mask        = "${each.value.source_prefix_mask}"
  remark                    = "${each.value.remark}"
}

##### End of ACL #####



##### End of SVI Int vrf #####

##### End of Config #####

##### Static config below #####

#