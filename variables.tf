##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

# Establish this is a HUB or spoke configuration
# is_hub: false   # (Optional) Establish this is a HUB or spoke configuration. Default: false
variable "is_hub" {
  type    = bool
  default = false
}

# spoke_def: "001"   # (Optional) Spoke definition. Default: "001"
variable "spoke_def" {
  type    = string
  default = "001"
}

# org:   # (Required) Organization information.
#   organization_name: "myorg"   # (Required) Organization name.
#   organization_unit: "myunit"   # (Required) Organization unit.
#   environment_type: "dev"      # (Required) Environment type (e.g., dev, prod).
#   environment_name: "development" # (Required) Environment name.
variable "org" {
  type = object({
    organization_name = string
    organization_unit = string
    environment_type  = string
    environment_name  = string
  })
}

# extra_tags: {}   # (Optional) Extra tags to add to resources. Default: {}
variable "extra_tags" {
  type    = map(string)
  default = {}
}
