output "gateway_id" {
  value = aws_internet_gateway.gw.id
}

output "nat_id" {
  value = aws_nat_gateway.nat.id
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet_id" {
  # value = { for subent in aws_subnet.subnets : subent.tags_all["Name"] => subnet.id }
  value = { for subnet in aws_subnet.subnets : subnet.tags_all["Name"] => subnet.id }
}
