variable "nxos_connection" {
  type = object({
    username = string
    password = string
    url_agg01 = string
    url_agg02 = string
  })
}


variable "provider-username" {
  type = string
  }

variable "provider-userpass" {
  type = string
  }

variable "provider-url-agg01" {
  type = string
  }

variable "provider-url-agg02" {
  type = string
  }

  variable "hostname-agg01" {
    type = string
  }

  variable "hostname-agg02" {
    type = string
  }

  variable "vrf-names" {
  type = list(string)
### It is not mandatroy to define a default action here  
}

variable "ipv4_vrf_map" {
 type = map(object({
   name = string
 }))
}

variable "vlan_map" {
 type = map(object({
   fabric_encap = string
   name   = string
 }))
}

variable "l2_int_map" {
 type = map(object({
   interface_id = string
   admin_state   = optional(string)
   mode = optional(string)
   trunk_vlans = optional(string)
   description = optional(string)
   layer = optional(string)
 }))
}

variable "svi_int_map" {
 type = map(object({
   interface_id = string
   admin_state   = optional(string)
   description = optional(string)
   mtu = optional(number)
 }))
}

variable "svi_int_vrf_map" {
 type = map(object({
   interface_id = string
   vrf_dn = string
 }))
} 

variable "po_int_map" {
 type = map(object({
   interface_id = string
   port_channel_mode = string
   minimum_links = optional(number)
   suspend_individual = optional(string)
   admin_state   = string
   mode = optional(string)
   trunk_vlans = optional(string)
   description = optional(string)
   layer = string
   mtu = optional(number)
 }))
}

variable "po_sub-int_map" {
  type = map(object({
    interface_id = string
    admin_state  = string
    description  = optional(string)
    mtu          = optional(number)
    encap = string
}))
}

variable "po_sub-int-vrf_map" {
  type = map(object({
    interface_id = string
    vrf_dn = string
}))
}

variable "po_vrf_map" {
  type = map(object({
    interface_id = string
    vrf_dn = string
}))
}

variable "po_member_map" {
  type = map(object({
    interface_id = string
    interface_dn = string
    force = bool
}))
}

variable "loopback_map" {
 type = map(object({
   interface_id = string
   admin_state   = string
   description = optional(string)
 }))
}

variable "loopback-vrf_map" {
 type = map(object({
   interface_id = string
   vrf_dn   = string
 }))
}

variable "ipv4_int_map-agg01" {
 type = map(object({
   vrf = string
   interface_id = string
  }))
}
  
variable "ipv4_int_address_map-agg01" {
 type = map(object({
   vrf = string
   interface_id = string
   address = string
 }))
}

variable "ipv4_int_map-agg02" {
 type = map(object({
   vrf = string
   interface_id = string
  }))
}
  
variable "ipv4_int_address_map-agg02" {
 type = map(object({
   vrf = string
   interface_id = string
   address = string
 }))
}

variable "static-routes_map" {
 type = map(object({
   vrf_name = string
   prefix-agg01   = string
   prefix-agg02 = string
   interface_id = string
   nh-address-agg01-agg02  = string
   nh-address-agg02-agg01 = string
 }))
}

variable "bgp_map" {
 type = map(object({
   admin_state = string
   local-asn   = string
   vrf-name = string
   router_id-agg01 = string
   router_id-agg02 = string
   address_family = string
   prefix-agg01 = string
   prefix-agg02 = string
   template_name = string
   remote-asn = string
   send-comm-extended = string
   send-comm-standard = string
   description = string
   peer_template = string
   peer-address-agg01-02 = string
   peer-address-agg02-01 = string
   peer-description = string
   source_interface = string
 }))
}

variable "acl-map" {
  type = map(object({
    name = string
  }))

} 