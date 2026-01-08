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
  