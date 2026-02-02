terraform {
  required_providers {
    nxos = {
      source = "CiscoDevNet/nxos"
    }
  }
}

##### USE YAML INPUT #####

### FIRST CREAT LOCAL BLOCK ###
locals {
  yaml_vars = yamldecode(file("./vars.yaml"))
}
### THEN MAP VARIABLES FROM LOCAL BLOCK TO TF VARIABLES ###
# Provider Variables
# variable "provider-username" {
#   default = local.yaml_vars.provider.username
# }
# variable "provider-userpass" {
#   default = local.yaml_vars.provider.userpass
# }
# variable "provider-url-agg01" {
#   default = local.yaml_vars.provider.url-agg01
# }
# variable "provider-url-agg02" {
#   default = local.yaml_vars.provider.url-agg02
# }
# # Hostname Variables
# variable "hostname-agg01" {
#   default = local.yaml_vars.hostname.hostname-agg01
# }
# variable "hostname-agg02" {
#   default = local.yaml_vars.hostname.hostname-agg02
# }


### TEST ON RESOURCE ###
resource "nxos_ipv4_access_list_policy_ingress_interface" "acl_example" {
  provider = nxos.twe-agg01
  interface_id     = local.yaml_vars.acl_interface_id # will creat as a map later
  access_list_name = local.yaml_vars.acl_acl_name
}

##### END OF USE YAML INPUT #####

################## MODULES ###############

###
# These are applied to individual switches
# It is how we get the dynamic variable applied to the switch  
###
module "config-twe-agg01" {
  source = "./modules/twe-agg01"
  provider-username = var.provider-username
  provider-userpass = var.provider-userpass
  provider-url-agg01 = var.provider-url-agg01
  hostname-agg01 = var.hostname-agg01
}  

module "config-twe-agg02" {
  source = "./modules/twe-agg02"
  provider-username = var.provider-username
  provider-userpass = var.provider-userpass
  provider-url-agg02 = var.provider-url-agg02
  hostname-agg02 = var.hostname-agg02
}

###
# These are static modules applied to all switches
# Take care before changing any of these variables
###

#####Enable Features #####

module "config-twe-features" {
  source = "./modules/features"
  provider-username = var.provider-username
  provider-userpass = var.provider-userpass
  provider-url-agg01 = var.provider-url-agg01
  provider-url-agg02 = var.provider-url-agg02
}

#####Enable vrf #####
module "config-twe-vrf" {
  source = "./modules/vrf"
  provider-username = var.provider-username
  provider-userpass = var.provider-userpass
  provider-url-agg01 = var.provider-url-agg01
  provider-url-agg02 = var.provider-url-agg02
  vrf-names = var.vrf-names
}

##### Configure  VLANs #####
module "config-common-vlans" {
  source = "./modules/vlan"
  provider-username = var.provider-username
  provider-userpass = var.provider-userpass
  provider-url-agg01 = var.provider-url-agg01
  provider-url-agg02 = var.provider-url-agg02
  vlan_map = var.vlan_map
}

##### Configure  Eth-Int #####
module "config-eth-int" {
  source = "./modules/Eth_Int"
  provider-username = var.provider-username
  provider-userpass = var.provider-userpass
  provider-url-agg01 = var.provider-url-agg01
  provider-url-agg02 = var.provider-url-agg02
  l2_int_map = var.l2_int_map
}

##### Configure  SVI #####
module "config-svi" {
  source = "./modules/svi"
  provider-username = var.provider-username
  provider-userpass = var.provider-userpass
  provider-url-agg01 = var.provider-url-agg01
  provider-url-agg02 = var.provider-url-agg02
  svi_int_map = var.svi_int_map
  svi_int_vrf_map = var.svi_int_vrf_map
}

##### Configure  po-Int #####
module "config-po-int" {
  source = "./modules/port-channels"
  provider-username = var.provider-username
  provider-userpass = var.provider-userpass
  provider-url-agg01 = var.provider-url-agg01
  provider-url-agg02 = var.provider-url-agg02
  po_int_map-agg01 = var.po_int_map-agg01
  po_sub-int_map-agg01 = var.po_sub-int_map-agg01
  po_sub-int-vrf_map-agg01 = var.po_sub-int-vrf_map-agg01
  po_vrf_map = var.po_vrf_map
  po_member_map-agg01 = var.po_member_map-agg01
  po_int_map-agg02 = var.po_int_map-agg02
  po_sub-int_map-agg02 = var.po_sub-int_map-agg02
  po_sub-int-vrf_map-agg02 = var.po_sub-int-vrf_map-agg02
  po_member_map-agg02 = var.po_member_map-agg02 
}

module "config-loopback-int" {
  source = "./modules/loopack_int"
  provider-username = var.provider-username
  provider-userpass = var.provider-userpass
  provider-url-agg01 = var.provider-url-agg01
  provider-url-agg02 = var.provider-url-agg02
  loopback_map = var.loopback_map
  loopback-vrf_map = var.loopback-vrf_map
}

module "config-ipv4-int-address" {
  source = "./modules/ipv4_address"
  provider-username = var.provider-username
  provider-userpass = var.provider-userpass
  provider-url-agg01 = var.provider-url-agg01
  provider-url-agg02 = var.provider-url-agg02
  ipv4_int_map-agg01 = var.ipv4_int_map-agg01
  ipv4_int_map-agg02 = var.ipv4_int_map-agg02
  ipv4_int_address_map-agg01 = var.ipv4_int_address_map-agg01
  ipv4_int_address_map-agg02 = var.ipv4_int_address_map-agg02
  ipv4_vrf_map = var.ipv4_vrf_map
}

module "config-vpc" {
  source = "./modules/vpc"
  provider-username = var.provider-username
  provider-userpass = var.provider-userpass
  provider-url-agg01 = var.provider-url-agg01
  provider-url-agg02 = var.provider-url-agg02
}

module "config-static-route" {
  source = "./modules/routing"
  provider-username = var.provider-username
  provider-userpass = var.provider-userpass
  provider-url-agg01 = var.provider-url-agg01
  provider-url-agg02 = var.provider-url-agg02
  static-routes_map = var.static-routes_map
  bgp_map = var.bgp_map
}

##### configure acl #####
module "config-twe-acl" {
  source = "./modules/acl"
  provider-username = var.provider-username
  provider-userpass = var.provider-userpass
  provider-url-agg01 = var.provider-url-agg01
  provider-url-agg02 = var.provider-url-agg02
  acl-map = var.acl-map
  acl-entry-map = var.acl-entry-map
}

################## END Of MODULES ###############

##### Return Data from Switches #####
data "nxos_system" "system-info-twe-agg01" {
  provider = nxos.twe-agg01
}
output "hostname-twe-agg01" {
  value = data.nxos_system.system-info-twe-agg01.name
}
data "nxos_system" "system-info-twe-agg02" {
  provider = nxos.twe-agg02
}
output "hostname-twe-agg02" {
  value = data.nxos_system.system-info-twe-agg02.name
}

##### REST API retulrn data
data "nxos_rest" "l1PhysIf-agg01" {
  provider = nxos.twe-agg01
  dn = "sys/intf/phys-[eth1/1]"
}
output "l1_phys_int_eth1_1" {
  value = data.nxos_rest.l1PhysIf-agg01.content.adminSt
}

##### REST API return data WIP ###

####Try to pass back from module ###
