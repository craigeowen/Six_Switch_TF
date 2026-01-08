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
