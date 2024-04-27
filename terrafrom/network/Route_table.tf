resource "aws_route_table" "route_tables" {
  vpc_id   = aws_vpc.vpc.id
  for_each = var.route_tables
  
  route {
    cidr_block = each.value.route_cidr_block
    gateway_id = each.value.gateway_id
  }

  tags = {
    Name = each.key
  }

}
