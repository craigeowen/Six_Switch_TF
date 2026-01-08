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
 