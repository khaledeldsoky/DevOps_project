resource "aws_eks_node_group" "eks_node_private" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "eks_node_group"
  node_role_arn   = data.aws_iam_role.eks_role.arn
  subnet_ids      = var.node_subnets
  
  capacity_type  = "ON_DEMAND"
  instance_types = ["t3.small"]

  scaling_config {
    desired_size = 2
    max_size     = 4
    min_size     = 2
  }

  # taint {
  #   key    = "team"
  #   value  = "devops"
  #   effect = "NO_SCHEDULE"
  # }

  # launch_template {
  #   name    = aws_launch_template.eks-with-disks.name
  #   version = aws_launch_template.eks-with-disks.latest_version
  # }

  update_config {
    max_unavailable = 1
  }

  labels = {
    node = "kube_node"
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  # depends_on = [
  #   # aws_iam_role_policy_attachment.nodes-AmazonEC2ContainerRegistryReadOnly,
  #   # aws_iam_role_policy_attachment.nodes-AmazonEKS_CNI_Policy,
  #   # aws_iam_role_policy_attachment.nodes-AmazonEKSWorkerNodePolicy,
  # ]

}

# launch template if required
# resource "aws_launch_template" "eks-with-disks" {
#   name = "eks-with-disks"

#   key_name = var.key_name

#   block_device_mappings {
#     device_name = "/dev/xvdb"

#     ebs {
#       volume_size = 50
#       volume_type = "gp2"
#     }
#   }
# }

