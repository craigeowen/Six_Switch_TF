terraform {
  required_providers {
    nxos = {
      source = "CiscoDevNet/nxos"
    }
  }
}

provider "nxos" {
  username = var.provider-username
  password = var.provider-userpass
  url      = var.provider-url-agg01
}

################## MODULES ###############
  

################## END Of MODULES ###############

################## CONFIG ###############

###Set HOSTNAME###
resource "nxos_system" "hostname-AGG01" {
  name = var.hostname-agg01
}
###END OF SET HOTNAME###

################## END OF CONFIG ###############

################## SAVE CONFIG ###############

resource "nxos_save_config" "save-config-agg01" {
}

################## END OF SAVE CONFIG ###############