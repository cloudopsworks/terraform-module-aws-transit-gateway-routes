##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

variable "vpc_route_table_ids" {
  description = "List of VPC Route Table identifiers to create routes to the Transit Gateway."
  type        = list(string)
  default     = []

}

variable "tgw_destination_cidr" {
  description = "Destination CIDR block for the Transit Gateway route."
  type        = string
  default     = ""
}

variable "ipv6_support" {
  description = "Enable IPv6 support for the Transit Gateway route."
  type        = bool
  default     = false
}

variable "transit_gateway_id" {
  description = "EC2 Transit Gateway identifier"
  type        = string
}

variable "transit_gateway_route_table_id" {
  description = "(optional) EC2 Transit Gateway Route Table identifier, defaults to blank, required if not provided through 'transit_gateway_routes'."
  type        = string
  default     = ""
}

variable "transit_gateway_attachment_id" {
  description = "(optional) EC2 Transit Gateway Attachment identifier, defaults to blank., required if not provided through 'transit_gateway_routes'."
  type        = string
  default     = ""
}

## Transit Gateway Routes
# This variable is used to create multiple Transit Gateway routes. Yaml Reference below:
#transit_gateway_routes:
#   - destination_cidr_block: "xxx.xx.xx.xx/xx"
#     transit_gateway_route_table_id: "tgw-rtb-xxxxxxxx"   # (optional) if not provided, will use 'transit_gateway_route_table_id' variable.
#     transit_gateway_attachment_id: "tgw-attach-xxxxxxxx" # (optional) if not provided, will use 'transit_gateway_attachment_id' variables.
#     blackhole: false # (optional) if set to true, the route will be a blackhole route.
variable "transit_gateway_routes" {
  description = "List of maps of Transit Gateway routes to create."
  type        = any
  default     = []
}

variable "create_association" {
  description = "Create Transit Gateway Route Table Association."
  type        = bool
  default     = false
}

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