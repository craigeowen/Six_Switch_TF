###### VARS ##### STATIC AT END OF FILE ######

##### Check if these are all chnageable or can be static #####

vlan_map = {
    "10" = {
    fabric_encap = "10"
    name         = "TEMP-TEST"
    },
    "20" = {
    fabric_encap = "20"
    name         = "TEMP-TEST2"
    },
    "1100" = {
    fabric_encap = "1100"
    name         = "xx-01_AGG_to_EDG"
    },
    "1101" = {
    fabric_encap = "1101"
    name         = "XX-01_ES_EDG"
  }
}
#
loopback_map = {
  "lo101" = {
  interface_id = "lo101"
  admin_state  = "up"
  description  = "### XX-01 loopback ###"
  },
  
}
#
loopback-vrf_map = {
  "lo101" = {
  interface_id = "lo101"
  vrf_dn       = "sys/inst-xx01_es_core"
  },
  
}
#
ipv4_vrf_map = {
  "xx01_es_core" = {
  name = "xx01_es_core"
  },
  
}
#
l2_int_map = {
  "eth1_7" = {
    interface_id          = "eth1/7"
    admin_state           = "up"
    mode                  = "trunk"
    trunk_vlans           = "1-4094"
    description           = "### vPC peer-link ###"
    layer                 = "Layer2"
  },
  "eth1_8" = {
    interface_id          = "eth1/8"
    admin_state           = "up"
    mode                  = "trunk"
    trunk_vlans           = "1-4094"
    description           = "### vPC peer-link ###"
    layer                 = "Layer2"
  },

}

svi_int_map = {
  "vlan1101" = {
    interface_id          = "vlan1101"
    admin_state           = "up"
    description           = "###SDWAN & CTN Handoff###"
    mtu                   = 9216
  },

}

svi_int_vrf_map = {
  "vlan1101" = {
    interface_id          = "vlan1101"
    vrf_dn                = "sys/inst-xx01_es_core"
  },

}

po_int_map-agg01 = {
   "po1" = {
    interface_id          = "po1"
    port_channel_mode     = "active"
    minimum_links         = 1
    suspend_individual    = "disable"
    admin_state           = "up"
    mode                  = "trunk"
    trunk_vlans           = "1-4094"
    description           = "### vPC peer-link ###"
    layer                 = "Layer2"
    },
   "po2" = {
    interface_id          = "po2"
    port_channel_mode     = "active"
    admin_state           = "up"
    description           = "### XX-01 AGG to AGG iBGP ###"
    layer                 = "Layer3"
    mtu                   = 9216
    },
    "po4" = {
    interface_id          = "po4"
    port_channel_mode     = "active"
    minimum_links         = 1
    admin_state           = "up"
    description           = "### vPC peer-keepalive ###"
    layer                 = "Layer3"
    mtu                   = 9216
    }, 
   "po111" = {
    interface_id          = "po111"
    port_channel_mode     = "active"
    admin_state           = "up"
    description           = "### XX-01 AGG to CORE BGP ###"
    layer                 = "Layer3"
    mtu                   = 9216
    },
   "po121" = {
    interface_id          = "po121"
    port_channel_mode     = "active"
    admin_state           = "up"
    description           = "### XX-01 AGG to CORE BGP ###"
    layer                 = "Layer3"
    mtu                   = 9216
    },           
}


po_int_map-agg02 = {
   "po1" = {
    interface_id          = "po1"
    port_channel_mode     = "active"
    minimum_links         = 1
    suspend_individual    = "disable"
    admin_state           = "up"
    mode                  = "trunk"
    trunk_vlans           = "1-4094"
    description           = "### vPC peer-link ###"
    layer                 = "Layer2"
    },
   "po2" = {
    interface_id          = "po2"
    port_channel_mode     = "active"
    admin_state           = "up"
    description           = "### XX-01 AGG to AGG iBGP ###"
    layer                 = "Layer3"
    mtu                   = 9216
    },
    "po4" = {
    interface_id          = "po4"
    port_channel_mode     = "active"
    minimum_links         = 1
    admin_state           = "up"
    description           = "### vPC peer-keepalive ###"
    layer                 = "Layer3"
    mtu                   = 9216
    }, 
   "po122" = {
    interface_id          = "po122"
    port_channel_mode     = "active"
    admin_state           = "up"
    description           = "### XX-01 AGG to CORE BGP ###"
    layer                 = "Layer3"
    mtu                   = 9216
    },
   "po112" = {
    interface_id          = "po112"
    port_channel_mode     = "active"
    admin_state           = "up"
    description           = "### XX-01 AGG to CORE BGP ###"
    layer                 = "Layer3"
    mtu                   = 9216
    },           
}

po_sub-int_map-agg01 = {
   "po1" = {
    interface_id = "po2.3010"
    admin_state  = "up"
    description  = "### XX-01 AGG to AGG iBGP ###"
    mtu          = 9216
    encap = "vlan-3010"
    },
   "po111" = {
    interface_id = "po111.3010"
    admin_state  = "up"
    description  = "### XX-01 AGG to RC BGP ###"
    mtu          = 9216
    encap = "vlan-3010"
    },
   "po121" = {
    interface_id = "po121.3010"
    admin_state  = "up"
    description  = "### XX-01 RC BGP ###"
    mtu          = 9216
    encap = "vlan-3010"
    },
}
po_sub-int_map-agg02 = {
   "po1" = {
    interface_id = "po2.3010"
    admin_state  = "up"
    description  = "### XX-01 AGG to AGG iBGP ###"
    mtu          = 9216
    encap = "vlan-3010"
    },
   "po122" = {
    interface_id = "po122.3010"
    admin_state  = "up"
    description  = "### XX-01 AGG to RC BGP ###"
    mtu          = 9216
    encap = "vlan-3010"
    },
   "po112" = {
    interface_id = "po112.3010"
    admin_state  = "up"
    description  = "### XX-01 RC BGP ###"
    mtu          = 9216
    encap = "vlan-3010"
    },
}

po_sub-int-vrf_map-agg01 = {
   "po2" = {
    interface_id = "po2.3010"
    vrf_dn       = "sys/inst-xx01_es_core"
    },
   "po111" = {
    interface_id = "po111.3010"
    vrf_dn       = "sys/inst-xx01_es_core"
    },
   "po121" = {
    interface_id = "po121.3010"
    vrf_dn       = "sys/inst-xx01_es_core"
    },    
}
po_sub-int-vrf_map-agg02 = {
   "po2" = {
    interface_id = "po2.3010"
    vrf_dn       = "sys/inst-xx01_es_core"
    },
   "po122" = {
    interface_id = "po122.3010"
    vrf_dn       = "sys/inst-xx01_es_core"
    },
   "po112" = {
    interface_id = "po112.3010"
    vrf_dn       = "sys/inst-xx01_es_core"
    },    
}

po_vrf_map = {
   "po4" = {
    interface_id = "po4"
    vrf_dn       = "sys/inst-vpc"
    },

}

po_member_map-agg01 = {
    "po1-1" = {
      interface_id = "po1"
      interface_dn = "sys/intf/phys-[eth1/7]"
      force        = true        
    },
    "po1-2" = {
      interface_id = "po1"
      interface_dn = "sys/intf/phys-[eth1/8]"
      force        = true        
    },
    "po2-1" = {
      interface_id = "po2"
      interface_dn = "sys/intf/phys-[eth1/10]"
      force        = true        
    },
    "po2-2" = {
      interface_id = "po2"
      interface_dn = "sys/intf/phys-[eth1/12]"
      force        = true        
    },    
    "po4" = {
      interface_id = "po4"
      interface_dn = "sys/intf/phys-[eth1/6]"
      force        = false        
    }, 
    "po111" = {
      interface_id = "po111"
      interface_dn = "sys/intf/phys-[eth1/9]"
      force        = true        
    },
    "po121" = {
      interface_id = "po121"
      interface_dn = "sys/intf/phys-[eth1/11]"
      force        = true        
    },
        
}
po_member_map-agg02 = {
    "po1-1" = {
      interface_id = "po1"
      interface_dn = "sys/intf/phys-[eth1/7]"
      force        = true        
    },
    "po1-2" = {
      interface_id = "po1"
      interface_dn = "sys/intf/phys-[eth1/8]"
      force        = true        
    },
    "po2-1" = {
      interface_id = "po2"
      interface_dn = "sys/intf/phys-[eth1/10]"
      force        = true        
    },
    "po2-2" = {
      interface_id = "po2"
      interface_dn = "sys/intf/phys-[eth1/12]"
      force        = true        
    },    
    "po4" = {
      interface_id = "po4"
      interface_dn = "sys/intf/phys-[eth1/6]"
      force        = false        
    }, 
    "po122" = {
      interface_id = "po122"
      interface_dn = "sys/intf/phys-[eth1/11]"
      force        = true        
    },
    "po112" = {
      interface_id = "po112"
      interface_dn = "sys/intf/phys-[eth1/9]"
      force        = true        
    },
        
}

ipv4_int_map-agg01 = {
    "po4" = {
        vrf = "vpc"
        interface_id = "po4"
    },
    "lo101" = {
        vrf = "xx01_es_core"
        interface_id = "lo101"
    },
    "po2_3010" = {
        vrf = "xx01_es_core"
        interface_id = "po2.3010"
    },
    "po111_3010" = {
        vrf = "xx01_es_core"
        interface_id = "po111.3010"
    },
    "po121_3010" = {
        vrf = "xx01_es_core"
        interface_id = "po121.3010"
    },
    "vlan1101" = {
        vrf = "xx01_es_core"
        interface_id = "vlan1101"
    },        
}

ipv4_int_address_map-agg01 = {
    "po4" = {
        vrf = "vpc"
        interface_id = "po4"
        address = "1.1.1.1/30"
    },    
    "lo101" = {
        vrf = "xx01_es_core"
        interface_id = "lo101"
        address = "10.66.127.3/32"
    },
    "po2_3010" = {
        vrf = "xx01_es_core"
        interface_id = "po2.3010"
        address = "10.66.125.10/31"
    },
    "po111_3010" = {
        vrf = "xx01_es_core"
        interface_id = "po111.3010"
        address = "10.66.125.3/31"
    },
    "po121_3010" = {
        vrf = "xx01_es_core"
        interface_id = "po121.3010"
        address = "10.66.125.7/31"
    },
    "vlan1101" = {
        vrf = "xx01_es_core"
        interface_id = "vlan1101"
        address = "10.66.1.1/28"
    },       
}

ipv4_int_map-agg02 = {
    "po4" = {
        vrf = "vpc"
        interface_id = "po4"
    },
    "lo101" = {
        vrf = "xx01_es_core"
        interface_id = "lo101"
    },
    "po2_3010" = {
        vrf = "xx01_es_core"
        interface_id = "po2.3010"
    },
    "po122_3010" = {
        vrf = "xx01_es_core"
        interface_id = "po122.3010"
    },
    "po112_3010" = {
        vrf = "xx01_es_core"
        interface_id = "po112.3010"
    }, 
    "vlan1101" = {
        vrf = "xx01_es_core"
        interface_id = "vlan1101"
    },        
}

ipv4_int_address_map-agg02 = {
    "po4" = {
        vrf = "vpc"
        interface_id = "po4"
        address = "1.1.1.2/30"
    },    
    "lo101" = {
        vrf = "xx01_es_core"
        interface_id = "lo101"
        address = "10.66.127.4/32"
    },
    "po2_3010" = {
        vrf = "xx01_es_core"
        interface_id = "po2.3010"
        address = "10.66.125.11/31"
    },
    "po122_3010" = {
        vrf = "xx01_es_core"
        interface_id = "po122.3010"
        address = "10.66.125.9/31"
    },
    "po112_3010" = {
        vrf = "xx01_es_core"
        interface_id = "po112.3010"
        address = "10.66.125.5/31 "
    },
    "vlan1101" = {
        vrf = "xx01_es_core"
        interface_id = "vlan1101"
        address = "10.66.1.2/28"
    },    
}

static-routes_map = {
    "po2_3010" = {
        vrf_name = "xx01_es_core"
        prefix-agg02   = "10.66.127.4/32"
        prefix-agg01 = "10.66.127.3/32"
        interface_id = "po2.3010"
        nh-address-agg01-agg02      = "10.66.125.11"
        nh-address-agg02-agg01 = "10.66.125.10"
  }
}

bgp_map = {
    "agg01" = {
        admin_state = "enabled"
        local-asn   = "65292"
        vrf-name = "xx01_es_core"
        router_id-agg01 = "10.66.127.3"
        router_id-agg02 = "10.66.127.4"
        address_family = "ipv4-ucast"
        prefix-agg01 = "10.66.127.3/32"
        prefix-agg02 = "10.66.127.4/32"
        template_name = "ibgp-baseline"
        remote-asn = "65292"
        send-comm-extended = "enabled"
        send-comm-standard = "enabled"
        description = "TF-BGP-TO-AGG02"
        peer_template = "ibgp-baseline"
        peer-address-agg01-02 = "10.66.127.4"
        peer-address-agg02-01 = "10.66.127.3"
        peer-description = "TF-BGP-TO-AGG02"
        source_interface = "lo101" 
  },
    "agg02" = {
        admin_state = "enabled"
        local-asn   = "65292"
        vrf-name = "xx01_es_core"
        router_id-agg01 = "10.66.127.3"
        router_id-agg02 = "10.66.127.4"
        address_family = "ipv4-ucast"
        prefix-agg01 = "10.66.127.3/32"
        prefix-agg02 = "10.66.127.4/32"
        template_name = "ibgp-baseline"
        remote-asn = "65292"
        send-comm-extended = "enabled"
        send-comm-standard = "enabled"
        description = "TF-BGP-TO-AGG02"
        peer_template = "ibgp-baseline"
        peer-address-agg01-02 = "10.66.127.4"
        peer-address-agg02-01 = "10.66.127.3"
        peer-description = "TF-BGP-TO-AGG02"
        source_interface = "lo101" 
  },
}

acl-map = {
   "50" = {
    name = "50"
    },
   "71" = {
    name = "71"
   },
}

acl-entry-map = {
   "50-1" = {
    name                      = "50"
    sequence_number           = 1
    remark                    = "------- VTY ACL -------"
    },
    "50-10" = {
    name                      = "50"
    sequence_number           = 10
    action                    = "permit"
    source_prefix        = "10.24.34.127"
    source_prefix_length = "32"
    destination_prefix = "0.0.0.0"
    destination_prefix_mask = "0.0.0.0"
    protocol                  = "ip"
    },
    "50-15" = {
    name                      = "50"
    sequence_number           = 15
    action                    = "permit"
    source_prefix        = "10.223.32.44"
    source_prefix_length = "32"
    destination_prefix = "0.0.0.0"
    destination_prefix_mask = "0.0.0.0"
    protocol                  = "ip"
    },    
     "71-1" = {
    name                      = "71"
    sequence_number           = 1
    remark                    = "------- SNMP ACL -------"
    },
    "71-55" = {
    name                      = "71"
    sequence_number           = 55
    action                    = "permit"
    source_prefix             = "10.221.16.0"
    source_prefix_length      = "24"    
    destination_prefix        = "10.24.114.1"
    destination_prefix_length = "32"
    protocol                  = "ip"
    }, 
}

###### END OF VARS #####

##### STATIC VARS CAUTION BEFORE CHANGING #####
provider-username = "cisco"
provider-userpass = "cisco"
provider-url-agg01 = "https://192.168.1.123"
provider-url-agg02 = "https://192.168.1.190"
hostname-agg01 = "Dev-Test-AGG01"
hostname-agg02 = "Dev-Test-AGG02"
#
vrf-names = ["vpc", "xx01_es_core"]
#

#
nxos_connection = {
  username = "cisco"
  password = "cisco"
  url_agg01 = "https://192.168.1.123"
  url_agg02 = "https://192.168.1.190"
}