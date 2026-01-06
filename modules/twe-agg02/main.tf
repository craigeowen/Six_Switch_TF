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
  url      = var.provider-url-agg02
}

################## MODULES ###############
  

################## END Of MODULES ###############

###set hostname###
resource "nxos_system" "hostname-AGG02" {
  name = var.hostname-agg02
}
###end of set hostname###

################## CONFIG ###############


################## END OF CONFIG ###############

################## SAVE CONFIG ###############

resource "nxos_save_config" "save-config-agg02" {
}

################## END OF SAVE CONFIG ###############
