resource "aws_eks_cluster" "eks_cluster" {
  name     = "eks_cluster"
  role_arn = data.aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids = var.cluster_subnets
  }

  # depends_on = [
  #   # aws_iam_role_policy_attachment.cluster_AmazonEKSVPCResourceController,
  #   aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy,
  # ]
  
}

# output "endpoint" {
#   value = aws_eks_cluster.example.endpoint
# }

# output "kubeconfig-certificate-authority-data" {
#   value = aws_eks_cluster.example.certificate_authority[0].data
# }