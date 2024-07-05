##
# (c) 2024 - Cloud Ops Works LLC - https://cloudops.works/
#            On GitHub: https://github.com/cloudopsworks
#            Distributed Under Apache v2.0 License
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

variable "transit_gateway_routes" {
  description = "List of maps of Transit Gateway routes to create."
  type        = any
  default     = []
}