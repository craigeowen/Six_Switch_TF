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

##### Layer 2 Eth Int #####

resource "nxos_physical_interface" "l2_int-agg01" {
  provider              = nxos.twe-agg01
  for_each              = {for k, v in var.l2_int_map : k => v}
  interface_id          = "${each.value.interface_id}"
  admin_state           = lookup(each.value, "admin_state", null)
  mode                  = lookup(each.value, "mode", null)
  trunk_vlans           = lookup(each.value, "trunk_vlans", null)
  description           = lookup(each.value, "description", null)
  layer                 = lookup(each.value, "layer", null)
}


resource "nxos_physical_interface" "l2_int-agg02" {
  provider              = nxos.twe-agg02
  for_each              = {for k, v in var.l2_int_map : k => v}
  interface_id          = "${each.value.interface_id}"
  admin_state           = lookup(each.value, "admin_state", null)
  mode                  = lookup(each.value, "mode", null)
  trunk_vlans           = lookup(each.value, "trunk_vlans", null)
  description           = lookup(each.value, "description", null)
  layer                 = lookup(each.value, "layer", null)
}
#   description  = lookup(each.value, "description", null)
##### End of Layer 2 Eth Int #####

##### End of Config #####

##### Static config below #####

##### Configure Physical Interface for use by PO4 #####
resource "nxos_rest" "Configure-eth1_6-po4-twe-agg01" {
  provider = nxos.twe-agg01
  dn = "sys/intf/phys-[eth1/6]"
  class_name = "l1PhysIf"
  content = {
    "adminSt": "up",
    "descr": "link to TWE-AGG02 via Port-Channel4",
    "layer": "Layer3",
    "id": "eth1/6",
    "mtu": "9216",
    "status": "created,modified"
  }
}

##### Configure Physical Interface for use by PO4 #####
resource "nxos_rest" "Configure-eth1_6-po4-twe-agg02" {
  provider = nxos.twe-agg02
  dn = "sys/intf/phys-[eth1/6]"
  class_name = "l1PhysIf"
  content = {
    "adminSt": "up",
    "descr": "link to TWE-AGG01 via Port-Channel4",
    "layer": "Layer3",
    "id": "eth1/6",
    "mtu": "9216",
    "status": "created,modified"
  }
}

##### Configure Physical Interface for use by PO2 #####
resource "nxos_rest" "Configure-eth1_10-po2-twe-agg01" {
  provider = nxos.twe-agg01
  dn = "sys/intf/phys-[eth1/10]"
  class_name = "l1PhysIf"
  content = {
    "adminSt": "up",
    "descr": "link to TWE-AGG02 via Port-Channel2",
    "layer": "Layer3",
    "id": "eth1/10",
    "mtu": "9216",
    "status": "created,modified"
  }
}
resource "nxos_rest" "Configure-eth1_12-po2-twe-agg01" {
  provider = nxos.twe-agg01
  dn = "sys/intf/phys-[eth1/12]"
  class_name = "l1PhysIf"
  content = {
    "adminSt": "up",
    "descr": "link to TWE-AGG02 via Port-Channel2",
    "layer": "Layer3",
    "id": "eth1/12",
    "mtu": "9216",
    "status": "created,modified"
  }
}
#
resource "nxos_rest" "Configure-eth1_10-po2-twe-agg02" {
  provider = nxos.twe-agg02
  dn = "sys/intf/phys-[eth1/10]"
  class_name = "l1PhysIf"
  content = {
    "adminSt": "up",
    "descr": "link to TWE-AGG02 via Port-Channel2",
    "layer": "Layer3",
    "id": "eth1/10",
    "mtu": "9216",
    "status": "created,modified"
  }
}
resource "nxos_rest" "Configure-eth1_12-po2-twe-agg02" {
  provider = nxos.twe-agg02
  dn = "sys/intf/phys-[eth1/12]"
  class_name = "l1PhysIf"
  content = {
    "adminSt": "up",
    "descr": "link to TWE-AGG02 via Port-Channel2",
    "layer": "Layer3",
    "id": "eth1/12",
    "mtu": "9216",
    "status": "created,modified"
  }
}