## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

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
| <a name="input_create_association"></a> [create\_association](#input\_create\_association) | Create Transit Gateway Route Table Association. | `bool` | `false` | no |
| <a name="input_create_propagation"></a> [create\_propagation](#input\_create\_propagation) | Create Transit Gateway Route Table Propagation. | `bool` | `false` | no |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_ipv6_support"></a> [ipv6\_support](#input\_ipv6\_support) | Enable IPv6 support for the Transit Gateway route. | `bool` | `false` | no |
| <a name="input_is_hub"></a> [is\_hub](#input\_is\_hub) | Establish this is a HUB or spoke configuration | `bool` | `false` | no |
| <a name="input_org"></a> [org](#input\_org) | n/a | <pre>object({<br/>    organization_name = string<br/>    organization_unit = string<br/>    environment_type  = string<br/>    environment_name  = string<br/>  })</pre> | n/a | yes |
| <a name="input_spoke_def"></a> [spoke\_def](#input\_spoke\_def) | n/a | `string` | `"001"` | no |
| <a name="input_tgw_destination_cidr"></a> [tgw\_destination\_cidr](#input\_tgw\_destination\_cidr) | Destination CIDR block for the Transit Gateway route. | `string` | `""` | no |
| <a name="input_transit_gateway_attachment_id"></a> [transit\_gateway\_attachment\_id](#input\_transit\_gateway\_attachment\_id) | (optional) EC2 Transit Gateway Attachment identifier, defaults to blank., required if not provided through 'transit\_gateway\_routes'. | `string` | `""` | no |
| <a name="input_transit_gateway_id"></a> [transit\_gateway\_id](#input\_transit\_gateway\_id) | EC2 Transit Gateway identifier | `string` | n/a | yes |
| <a name="input_transit_gateway_route_table_id"></a> [transit\_gateway\_route\_table\_id](#input\_transit\_gateway\_route\_table\_id) | (optional) EC2 Transit Gateway Route Table identifier, defaults to blank, required if not provided through 'transit\_gateway\_routes'. | `string` | `""` | no |
| <a name="input_transit_gateway_routes"></a> [transit\_gateway\_routes](#input\_transit\_gateway\_routes) | List of maps of Transit Gateway routes to create. | `any` | `[]` | no |
| <a name="input_vpc_route_table_ids"></a> [vpc\_route\_table\_ids](#input\_vpc\_route\_table\_ids) | List of VPC Route Table identifiers to create routes to the Transit Gateway. | `list(string)` | `[]` | no |

## Outputs

No outputs.
