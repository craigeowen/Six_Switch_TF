terraform {
  required_providers {
    nxos = {
      source = "CiscoDevNet/nxos"
    }
  }
}

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