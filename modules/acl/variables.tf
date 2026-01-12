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

variable "acl-map" {
  type = map(object({
    name = string
  }))
}

variable "acl-entry-map" {
  type = map(object({
  name                      = string
  sequence_number           = number
  action                    = optional(string)
  destination_port_operator = optional(string)
  destination_prefix        = optional(string)
  destination_prefix_length = optional(string)
  destination_prefix_mask   = optional(string)
  protocol                  = optional(string)
  source_port_operator      = optional(string)
  source_prefix             = optional(string)
  source_prefix_length      = optional(string)
  source_prefix_mask        = optional(string) 
  remark                    = optional(string) 
  }))
}