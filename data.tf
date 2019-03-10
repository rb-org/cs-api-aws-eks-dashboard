# Data Resources

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "aws_eks_cluster_auth" "main" {
  name = "${data.terraform_remote_state.cs_api_eks.eks_cluster_name}"
}

data "aws_eks_cluster" "main" {
  name = "${data.terraform_remote_state.cs_api_eks.eks_cluster_name}"
}
