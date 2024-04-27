resource "aws_subnet" "subnets" {
  vpc_id            = aws_vpc.vpc.id
  for_each          = var.subnets
  cidr_block        = each.value.subnets_cidr_block
  availability_zone = each.value.availability_zone
  
  tags = {
    Name                         = each.key
    "kubernetes.io/role/${each.value.type_loadbalancer}" = "1" #this instruct the kubernetes to create public load balancer in these subnets
    "kubernetes.io/cluster/eks_cluster" = "shared"
  }

}
