#-------------- network --------------#
vpc_cidr_block   = "10.0.0.0/16"
pr_1_cidr_block  = "10.0.1.0/24"
pr_2_cidr_block  = "10.0.2.0/24"
pub_1_cidr_block = "10.0.3.0/24"
pub_2_cidr_block = "10.0.4.0/24"
route_cidr_block = "0.0.0.0/0"

public_route_table_gateway_name = "public_route_table_gateway"
private_route_table_nat_name    = "private_route_table_nat"

nat_subnet_name = "public_subnet_1"

instance_type_t2_micro  = "t2.micro"
instance_type_t3_small  = "t3.small"
instance_type_t3_medium = "t3.medium"
