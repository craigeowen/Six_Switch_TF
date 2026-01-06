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

variable "vlan_map" {
 type = map(object({
   fabric_encap = string
   name   = string
 }))
}
  