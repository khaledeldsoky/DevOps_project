
#---------------------- cluster role ----------------------#

# resource "aws_iam_role" "eks_role" {
#   name = "LabRole"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#       },
#     ]
#   })

#   # tags = {
#   #   cloudlab = "c109541a2581524l5882020t1w975050112479"
#   # }
# }

data "aws_iam_role" "eks_role" {
  name = "LabRole"
}

# resource "aws_iam_role_policy_attachment" "cluster_AmazonEKSClusterPolicy" {
#   role       = data.aws_iam_role.eks_role.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
# }


# resource "aws_iam_role_policy_attachment" "cluster_AmazonEKSVPCResourceController" {
#   role       = data.aws_iam_role.eks_role.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
# }



#---------------------- node role ----------------------#

# resource "aws_iam_role_policy_attachment" "nodes-AmazonEKSWorkerNodePolicy" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
#   role       = data.aws_iam_role.eks_role.name
# }

# resource "aws_iam_role_policy_attachment" "nodes-AmazonEKS_CNI_Policy" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
#   role       = data.aws_iam_role.eks_role.name
# }

# resource "aws_iam_role_policy_attachment" "nodes-AmazonEC2ContainerRegistryReadOnly" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
#   role       = data.aws_iam_role.eks_role.name
# }




