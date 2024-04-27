variable "vpc_cidr_block" {
  type = string

}


variable "subnets" {
  type = map(object({
    subnets_cidr_block = string
    route_table_name   = string
    availability_zone  = string
    type_loadbalancer  = string
  }))
}

variable "route_tables" {
  type = map(object({
    route_cidr_block = string
    gateway_id       = string
  }))
}

variable "nat_subnet_name" {
  type = string
}


