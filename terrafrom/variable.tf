#--------------------- Vpc ---------------------#
variable "vpc_cidr_block" {
  type = string
}

#--------------------- subnets ---------------------#

variable "pr_1_cidr_block" {
  type = string
}

variable "private_route_table_nat_name" {
  type = string
}

variable "public_route_table_gateway_name" {
  type = string
}

variable "pr_2_cidr_block" {
  type = string
}

variable "pub_1_cidr_block" {
  type = string
}

variable "pub_2_cidr_block" {
  type = string
}

variable "route_cidr_block" {
  type = string
}

variable "nat_subnet_name" {
  type = string
}

#--------------------- Ec2 ---------------------#

variable "instance_type_t2_micro" {
  type = string
}

variable "instance_type_t3_small" {
  type = string
}

variable "instance_type_t3_medium" {
  type = string
}

