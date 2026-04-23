## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.35 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.42.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tags"></a> [tags](#module\_tags) | cloudopsworks/tags/local | 1.0.9 |

## Resources

| Name | Type |
|------|------|
| [aws_ec2_transit_gateway_route.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route) | resource |
| [aws_ec2_transit_gateway_route_table_association.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route_table_association) | resource |
| [aws_ec2_transit_gateway_route_table_propagation.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route_table_propagation) | resource |
| [aws_route.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_association"></a> [create\_association](#input\_create\_association) | Create a Transit Gateway route table association for transit\_gateway\_attachment\_id. | `bool` | `false` | no |
| <a name="input_create_propagation"></a> [create\_propagation](#input\_create\_propagation) | Create a Transit Gateway route table propagation for transit\_gateway\_attachment\_id. | `bool` | `false` | no |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | Extra tags to add to the resources | `map(string)` | `{}` | no |
| <a name="input_ipv6_support"></a> [ipv6\_support](#input\_ipv6\_support) | Create VPC route table routes with destination\_ipv6\_cidr\_block instead of destination\_cidr\_block. | `bool` | `false` | no |
| <a name="input_is_hub"></a> [is\_hub](#input\_is\_hub) | Is this a hub or spoke configuration? | `bool` | `false` | no |
| <a name="input_org"></a> [org](#input\_org) | Organization details | <pre>object({<br/>    organization_name = string<br/>    organization_unit = string<br/>    environment_type  = string<br/>    environment_name  = string<br/>  })</pre> | n/a | yes |
| <a name="input_replace_existing"></a> [replace\_existing](#input\_replace\_existing) | Replace an existing Transit Gateway route table association when create\_association is true. | `bool` | `false` | no |
| <a name="input_spoke_def"></a> [spoke\_def](#input\_spoke\_def) | Spoke ID Number, must be a 3 digit number | `string` | `"001"` | no |
| <a name="input_tgw_destination_cidr"></a> [tgw\_destination\_cidr](#input\_tgw\_destination\_cidr) | Destination CIDR block for VPC route table routes. Use IPv4 CIDR when ipv6\_support is false, or IPv6 CIDR when true. | `string` | `""` | no |
| <a name="input_transit_gateway_attachment_id"></a> [transit\_gateway\_attachment\_id](#input\_transit\_gateway\_attachment\_id) | EC2 Transit Gateway attachment ID used for static routes, association, and propagation when not supplied per route. | `string` | `""` | no |
| <a name="input_transit_gateway_id"></a> [transit\_gateway\_id](#input\_transit\_gateway\_id) | EC2 Transit Gateway ID used by VPC route table routes. | `string` | n/a | yes |
| <a name="input_transit_gateway_route_table_id"></a> [transit\_gateway\_route\_table\_id](#input\_transit\_gateway\_route\_table\_id) | EC2 Transit Gateway route table ID used for static routes, association, and propagation when not supplied per route. | `string` | `""` | no |
| <a name="input_transit_gateway_routes"></a> [transit\_gateway\_routes](#input\_transit\_gateway\_routes) | Static Transit Gateway routes to create. | `any` | `[]` | no |
| <a name="input_vpc_route_table_ids"></a> [vpc\_route\_table\_ids](#input\_vpc\_route\_table\_ids) | List of VPC route table IDs where routes to the Transit Gateway will be created. | `list(string)` | `[]` | no |

## Outputs

No outputs.
