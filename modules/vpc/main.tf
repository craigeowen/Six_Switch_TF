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


##### Create VPC #####
resource "nxos_vpc_instance" "vpc-agg01" {
  provider = nxos.twe-agg01   
  admin_state = "enabled"
}
resource "nxos_vpc_instance" "vpc-agg02" {
  provider = nxos.twe-agg02   
  admin_state = "enabled"
}

resource "nxos_vpc_domain" "vcp-dom-agg01" {
  provider = nxos.twe-agg01  
  admin_state                    = "enabled"
  domain_id                      = 101
  peer_switch = "enabled"
  role_priority = 10
  peer_gateway = "enabled"
  l3_peer_router = "enabled"
  auto_recovery = "enabled"
  auto_recovery_interval = 60
}
resource "nxos_vpc_domain" "vcp-dom-agg02" {
  provider = nxos.twe-agg02 
  admin_state                    = "enabled"
  domain_id                      = 101
  peer_switch = "enabled"
  role_priority = 10
  peer_gateway = "enabled"
  l3_peer_router = "enabled"
  auto_recovery = "enabled"
  auto_recovery_interval = 60
}

##### Required to add IP Arp sync to the vpc domain #####
resource "nxos_rest" "Configure-vpc-dom-arp-inst-agg01" {
  provider = nxos.twe-agg01
  dn = "sys/arp/inst/vpc"
  class_name = "arpVpc"
  content = {

  }
}
resource "nxos_rest" "Configure-vpc-dom-arp-inst-agg02" {
  provider = nxos.twe-agg02
  dn = "sys/arp/inst/vpc"
  class_name = "arpVpc"
  content = {

  }
}

resource "nxos_rest" "Configure-vpc-dom-arp-agg01" {
  provider = nxos.twe-agg01
  dn = "sys/arp/inst/vpc/dom-[101]"
  class_name = "arpVpcDom"
  content = {
    "arpSync": "enabled",
    "domainId": "101",
    "status": "created,modified"
  }
}
resource "nxos_rest" "Configure-vpc-dom-arp-agg02" {
  provider = nxos.twe-agg02
  dn = "sys/arp/inst/vpc/dom-[101]"
  class_name = "arpVpcDom"
  content = {
    "arpSync": "enabled",
    "domainId": "101",
    "status": "created,modified"
  }
}


resource "nxos_vpc_keepalive" "vpc-keepalive-agg0" {
  provider = nxos.twe-agg01
  destination_ip                     = "1.1.1.2"
  source_ip                          = "1.1.1.1"
  vrf                                = "vpc"
}
resource "nxos_vpc_keepalive" "vpc-keepalive-agg02" {
  provider = nxos.twe-agg02
  destination_ip                     = "1.1.1.1"
  source_ip                          = "1.1.1.2"
  vrf                                = "vpc"
}

resource "nxos_vpc_peerlink" "vpc-peerlink-agg01" {
  provider = nxos.twe-agg01
  port_channel_id = "po1"
}
resource "nxos_vpc_peerlink" "vpc-peerlink-agg02" {
  provider = nxos.twe-agg02
  port_channel_id = "po1"
}


