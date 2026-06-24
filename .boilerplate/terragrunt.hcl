locals {
  local_vars  = yamldecode(file("./inputs.yaml"))
  spoke_vars  = yamldecode(file(find_in_parent_folders("spoke-inputs.yaml")))
  region_vars = yamldecode(file(find_in_parent_folders("region-inputs.yaml")))
  env_vars    = yamldecode(file(find_in_parent_folders("env-inputs.yaml")))
  global_vars = yamldecode(file(find_in_parent_folders("global-inputs.yaml")))

  local_tags  = jsondecode(file("./local-tags.json"))
  spoke_tags  = jsondecode(file(find_in_parent_folders("spoke-tags.json")))
  region_tags = jsondecode(file(find_in_parent_folders("region-tags.json")))
  env_tags    = jsondecode(file(find_in_parent_folders("env-tags.json")))
  global_tags = jsondecode(file(find_in_parent_folders("global-tags.json")))

  tags = merge(
    local.global_tags,
    local.env_tags,
    local.region_tags,
    local.spoke_tags,
    local.local_tags
  )
}

include "root" {
  path = find_in_parent_folders("{{ .RootFileName }}")
}
{{ if .vpc_enabled }}
dependency "vpc" {
  config_path = "{{ .vpc_path }}"
  # Configure mock outputs for the `validate` command that are returned when there are no outputs available (e.g the
  # module hasn't been applied yet.
  mock_outputs_allowed_terraform_commands = ["validate", "destroy"]
  mock_outputs = {
    vpc_name          = "sample-vpc"
    vpc_id            = "vpc-12345678901234"
    private_route_table_ids = [
      "rtb-1234567890",
      "rtb-1234567891",
      "rtb-1234567892",
    ]
    public_route_table_ids = [
      "rtb-1234567893",
      "rtb-1234567894",
    ]
    intra_route_table_ids = [
      "rtb-1234567895",
      "rtb-1234567896",
      "rtb-1234567897",
    ]
    database_route_table_ids = [
      "rtb-1234567898",
      "rtb-1234567899",
    ]
  }
}
{{ end }}
{{ if .tgw_enabled }}
dependency "tgw" {
  config_path = "{{ .tgw_path }}"
  # Configure mock outputs for the `validate` command that are returned when there are no outputs available (e.g the
  # module hasn't been applied yet.
  mock_outputs_allowed_terraform_commands = ["validate", "destroy"]
  mock_outputs = {
    transit_gateway_arn            = "arn:aws:ec2:us-west-2:551110472991:transit-gateway/tgw-12345678901234",
    transit_gateway_id             = "tgw-12345678901234"
    transit_gateway_route_table_id = "tgw-rtb-12345678901234"
  }
}
{{ end }}
{{ if .tgw_att_enabled }}
dependency "att" {
  config_path = "{{ .tgw_att_path }}"
  # Configure mock outputs for the `validate` command that are returned when there are no outputs available (e.g the
  # module hasn't been applied yet.
  mock_outputs_allowed_terraform_commands = ["validate", "destroy"]
  mock_outputs = {
    transit_gateway_attachments = [
      {
        id                 = "tgw-attach-123456789012345"
        transit_gateway_id = "tgw-1234567890123456"
        vpc_id             = "vpc-123456789012345"
      }
    ]
  }
}
{{ end }}
terraform {
  source = "{{ .sourceUrl }}"
}

inputs = {
  is_hub     = {{ .is_hub }}
  org        = local.env_vars.org
  spoke_def  = local.spoke_vars.spoke
  {{- range .requiredVariables }}
  {{- if ne .Name "org" }}
  {{- if and $.tgw_enabled (eq .Name "transit_gateway_id") }}
  {{ .Name }} = dependency.tgw.outputs.{{ .Name }}
  {{- else }}
  {{ .Name }} = local.local_vars.{{ .Name }}
  {{- end }}
  {{- end }}
  {{- end }}
  {{- range .optionalVariables }}
  {{- if not (eq .Name "extra_tags" "is_hub" "spoke_def" "org") }}
  {{- if and $.vpc_enabled (eq .Name "vpc_route_table_ids") }}
  {{- if eq .vpc_subnets "both" }}
  vpc_route_table_ids = concat(dependency.vpc.outputs.private_route_table_ids, dependency.vpc.outputs.database_route_table_ids)
  {{- else if eq .vpc_subnets "none" }}
  vpc_route_table_ids = []
  {{- else }}
  vpc_route_table_ids = dependency.vpc.outputs.{{ .vpc_subnets }}_route_table_ids
  {{- end }}
  {{- else if and $.tgw_enabled (eq .Name "transit_gateway_route_table_id") }}
  {{ .Name }} = dependency.tgw.outputs.{{ .Name }}
  {{- else if and $.tgw_att_enabled (eq .Name "transit_gateway_attachment_id") }}
  {{ .Name }} = dependency.att.outputs.transit_gateway_attachments[0].id
  {{- else}}
  {{ .Name }} = try(local.local_vars.{{ .Name }}, {{ .DefaultValue }})
  {{- end }}
  {{- end }}
  {{- end }}
  extra_tags = local.tags
}