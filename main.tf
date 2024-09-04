##
# (c) 2024 - Cloud Ops Works LLC - https://cloudops.works/
#            On GitHub: https://github.com/cloudopsworks
#            Distributed Under Apache v2.0 License
#

# Transit gateway route
resource "aws_ec2_transit_gateway_route" "this" {
  count                  = length(var.transit_gateway_routes)
  destination_cidr_block = var.transit_gateway_routes[count.index].destination_cidr_block
  blackhole              = try(var.transit_gateway_routes[count.index].blackhole, null)

  transit_gateway_route_table_id = try(var.transit_gateway_routes[count.index].transit_gateway_route_table_id, var.transit_gateway_route_table_id)
  transit_gateway_attachment_id  = tobool(try(var.transit_gateway_routes[count.index].blackhole, false)) == false ? try(var.transit_gateway_routes[count.index].transit_gateway_attachment_id, var.transit_gateway_attachment_id) : null
}

locals {
  vpc_route_table_destination_cidr = [
    for rtb_id in var.vpc_route_table_ids : {
      rtb_id       = rtb_id
      cidr         = var.tgw_destination_cidr
      ipv6_support = var.ipv6_support
      tgw_id       = var.transit_gateway_id
    }
  ]
}

resource "aws_ec2_transit_gateway_route_table_association" "this" {
  count = var.create_association ? 1 : 0

  # Create association if it was not set already by aws_ec2_transit_gateway_vpc_attachment resource
  transit_gateway_attachment_id  = var.transit_gateway_attachment_id
  transit_gateway_route_table_id = var.transit_gateway_route_table_id
  replace_existing_association   = true
}

resource "aws_ec2_transit_gateway_route_table_propagation" "this" {
  count = var.create_propagation ? 1 : 0

  # Create association if it was not set already by aws_ec2_transit_gateway_vpc_attachment resource
  transit_gateway_attachment_id  = var.transit_gateway_attachment_id
  transit_gateway_route_table_id = var.transit_gateway_route_table_id
}


# Network Related Route to TGW
resource "aws_route" "this" {
  for_each = { for x in local.vpc_route_table_destination_cidr : x.rtb_id => {
    cidr         = x.cidr
    ipv6_support = x.ipv6_support
    tgw_id       = x.tgw_id
  } }

  route_table_id              = each.key
  destination_cidr_block      = try(each.value.ipv6_support, false) ? null : each.value["cidr"]
  destination_ipv6_cidr_block = try(each.value.ipv6_support, false) ? each.value["cidr"] : null
  transit_gateway_id          = var.transit_gateway_id
}


