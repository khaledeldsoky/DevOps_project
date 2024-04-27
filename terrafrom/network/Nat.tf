resource "aws_nat_gateway" "nat" {
  depends_on    = [aws_subnet.subnets]
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.subnets[var.nat_subnet_name].id
  tags = {
    Name = "nat_gateway"
  }
}

resource "aws_eip" "lb" {
  domain = "vpc"
  tags = {
    Name = "elastic_ip"
  }
}
