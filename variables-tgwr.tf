##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

# vpc_route_table_ids: []   # (Optional) List of VPC Route Table identifiers to create routes to the Transit Gateway. Default: []
variable "vpc_route_table_ids" {
  description = "List of VPC Route Table identifiers to create routes to the Transit Gateway."
  type        = list(string)
  default     = []

}

# tgw_destination_cidr: ""   # (Optional) Destination CIDR block for the Transit Gateway route. Default: ""
variable "tgw_destination_cidr" {
  description = "Destination CIDR block for the Transit Gateway route."
  type        = string
  default     = ""
}

# ipv6_support: false   # (Optional) Enable IPv6 support for the Transit Gateway route. Default: false
variable "ipv6_support" {
  description = "Enable IPv6 support for the Transit Gateway route."
  type        = bool
  default     = false
}

# transit_gateway_id: "tgw-12345678"   # (Required) EC2 Transit Gateway identifier.
variable "transit_gateway_id" {
  description = "EC2 Transit Gateway identifier"
  type        = string
}

# transit_gateway_route_table_id: ""   # (Optional) EC2 Transit Gateway Route Table identifier, defaults to blank, required if not provided through 'transit_gateway_routes'. Default: ""
variable "transit_gateway_route_table_id" {
  description = "(optional) EC2 Transit Gateway Route Table identifier, defaults to blank, required if not provided through 'transit_gateway_routes'."
  type        = string
  default     = ""
}

# transit_gateway_attachment_id: ""   # (Optional) EC2 Transit Gateway Attachment identifier, defaults to blank., required if not provided through 'transit_gateway_routes'. Default: ""
variable "transit_gateway_attachment_id" {
  description = "(optional) EC2 Transit Gateway Attachment identifier, defaults to blank., required if not provided through 'transit_gateway_routes'."
  type        = string
  default     = ""
}

# transit_gateway_routes: []   # (Optional) List of maps of Transit Gateway routes to create. Default: []
#   - destination_cidr_block: "10.0.0.0/8"   # (Required) Destination CIDR block for the Transit Gateway route.
#     blackhole: false   # (Optional) Whether to create a blackhole route. Default: false
#     transit_gateway_route_table_id: "tgw-rtb-12345678"   # (Optional) EC2 Transit Gateway Route Table identifier. Defaults to var.transit_gateway_route_table_id
#     transit_gateway_attachment_id: "tgw-attach-12345678"   # (Optional) EC2 Transit Gateway Attachment identifier. Defaults to var.transit_gateway_attachment_id
variable "transit_gateway_routes" {
  description = "List of maps of Transit Gateway routes to create."
  type        = any
  default     = []
}

# create_association: false   # (Optional) Create Transit Gateway Route Table Association. Default: false
variable "create_association" {
  description = "Create Transit Gateway Route Table Association."
  type        = bool
  default     = false
}

# create_propagation: false   # (Optional) Create Transit Gateway Route Table Propagation. Default: false
variable "create_propagation" {
  description = "Create Transit Gateway Route Table Propagation."
  type        = bool
  default     = false
}

variable "replace_existing" {
  description = "Replace existing Transit Gateway Route Table Association or Propagation."
  type        = bool
  default     = false
}