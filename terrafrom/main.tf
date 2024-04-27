module "network" {
  source = "./network"

  vpc_cidr_block = "10.0.0.0/16"

  subnets = {

    private_subnet_1 = {
      subnets_cidr_block = var.pr_1_cidr_block
      route_table_name   = var.private_route_table_nat_name
      availability_zone  = data.aws_availability_zones.available.names[0]
      type_loadbalancer  = "internal-elb"
    }

    private_subnet_2 = {
      subnets_cidr_block = var.pr_2_cidr_block
      route_table_name   = var.private_route_table_nat_name
      availability_zone  = data.aws_availability_zones.available.names[1]
      type_loadbalancer  = "internal-elb"

    }

    public_subnet_1 = {
      subnets_cidr_block = var.pub_1_cidr_block
      route_table_name   = var.public_route_table_gateway_name
      availability_zone  = data.aws_availability_zones.available.names[0]
      type_loadbalancer  = "elb"

    }

    public_subnet_2 = {
      subnets_cidr_block = var.pub_2_cidr_block
      route_table_name   = var.public_route_table_gateway_name
      availability_zone  = data.aws_availability_zones.available.names[1]
      type_loadbalancer  = "elb"

    }
  }

  route_tables = {

    private_route_table_nat = {
      route_cidr_block = var.route_cidr_block
      gateway_id       = module.network.nat_id
    }

    public_route_table_gateway = {
      route_cidr_block = var.route_cidr_block
      gateway_id       = module.network.gateway_id
    }

  }

  nat_subnet_name = var.nat_subnet_name

}

module "security" {
  source = "./security"
  vpc_id = module.network.vpc_id
  key_pair = {
    # private_ec2_key_name = {
    #   key_name = "private_ec2_key_name"
    # }
    public_ec2_key_name = {
      key_name = "public_ec2_key_name"
    }
  }
}

module "eks" {
  source          = "./eks"
  cluster_subnets = [module.network.subnet_id["public_subnet_1"], module.network.subnet_id["public_subnet_2"], module.network.subnet_id["private_subnet_1"], module.network.subnet_id["private_subnet_2"]]
  node_subnets    = [module.network.subnet_id["private_subnet_1"], module.network.subnet_id["private_subnet_2"]]
  key_name        = module.security.key_name["public_ec2_key_name"]
}

module "Ec2" {
  source = "./ec2"
  Ec2 = {

    public_ec2_1 = {
      ami                 = data.aws_ami.ubuntu.id
      instance_type       = var.instance_type_t3_small
      associate_public_ip = true
      subnet_id           = module.network.subnet_id["public_subnet_1"]
      security_group_ids  = module.security.security_group_jenkins.id
      key_name            = module.security.key_name["public_ec2_key_name"]
    }

    # public_ec2_2 = {
    #   ami                 = data.aws_ami.ubuntu.id
    #   instance_type       = var.instance_type_t3_small
    #   associate_public_ip = true
    #   subnet_id           = module.network.subnet_id["public_subnet_1"]
    #   security_group_ids  = module.security.security_group_public.id
    #   key_name            = module.security.key_name["public_ec2_key_name"]
    # }

    # private_ec2_1 = {
    #   ami                 = data.aws_ami.ubuntu.id
    #   instance_type       = var.instance_type_t3_small
    #   associate_public_ip = false
    #   subnet_id           = module.network.subnet_id["private_subnet_1"]
    #   security_group_ids  = module.security.security_group_public.id
    #   key_name            = module.security.key_name["private_ec2_key_name"]
    # }

    # private_ec2_2 = {
    #   ami                 = data.aws_ami.ubuntu.id
    #   instance_type       = var.instance_type_t3_small
    #   associate_public_ip = false
    #   subnet_id           = module.network.subnet_id["private_subnet_2"]
    #   security_group_ids  = module.security.security_group_public.id
    #   key_name            = module.security.key_name["private_ec2_key_name"]
    # }

  }
}
