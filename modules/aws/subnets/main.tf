resource "aws_subnet" "this" {
  for_each = var.subnets

  # vpc_id가 있으면 우선 사용하고, 없으면 vpc_name 값으로 lookup, 둘 다 없으면 null 반환
  vpc_id = each.value.vpc_id != null ? each.value.vpc_id : (each.value.vpc_name != null ? lookup(var.vpc_ids, each.value.vpc_name, null) : null)

  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone

  map_public_ip_on_launch         = lookup(each.value, "map_public_ip_on_launch", null)
  assign_ipv6_address_on_creation = lookup(each.value, "assign_ipv6_address_on_creation", null)
  ipv6_cidr_block                 = lookup(each.value, "ipv6_cidr_block", null)

  tags = merge(
    var.common_tags,
    lookup(each.value, "tags", {}),
    {
      Name = each.key
    }
  )
}

resource "aws_route_table_association" "this" {
  for_each = {
    for key, subnet in var.subnets : key => subnet
    if lookup(subnet, "route_table_id", null) != null
  }

  subnet_id      = aws_subnet.this[each.key].id
  route_table_id = each.value.route_table_id
}
