resource "aws_vpc" "this" {
  for_each = var.vpcs

  cidr_block                       = each.value.cidr_block
  assign_generated_ipv6_cidr_block = each.value.assign_generated_ipv6_cidr_block
  enable_dns_support               = each.value.enable_dns_support
  enable_dns_hostnames             = each.value.enable_dns_hostnames
  instance_tenancy                 = each.value.instance_tenancy

  tags = merge(
    var.common_tags,
    each.value.tags,
    { 
      "Location" = var.location,
      "Name"     = each.key
    }
  )
}

locals {
  additional_cidrs = flatten([
    for vpc_key, vpc in var.vpcs : [
      for cidr in vpc.additional_cidrs : {
        vpc_key = vpc_key
        cidr    = cidr
      }
    ]
  ])
}

resource "aws_vpc_ipv4_cidr_block_association" "additional" {
  for_each = { for ac in local.additional_cidrs : "${ac.vpc_key}-${ac.cidr}" => ac }

  vpc_id    = aws_vpc.this[each.value.vpc_key].id
  cidr_block = each.value.cidr
}
