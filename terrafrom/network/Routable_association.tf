resource "aws_route_table_association" "route_tables_association" {
  for_each       = var.subnets
  subnet_id      = aws_subnet.subnets[each.key].id
  route_table_id = aws_route_table.route_tables[each.value.route_table_name].id
}
