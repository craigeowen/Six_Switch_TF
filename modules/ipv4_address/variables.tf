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

variable "ipv4_vrf_map" {
 type = map(object({
   name = string
 }))
}