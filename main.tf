module "kubernetes" {
  source = "./kubernetes"

  # EKS Cluster
  eks_cluster_name           = "${data.terraform_remote_state.cs_api_eks.eks_cluster_name}"
  eks_cluster_endpoint       = "${data.terraform_remote_state.cs_api_eks.eks_cluster_endpoint}"
  eks_cluster_cert_auth_data = "${data.terraform_remote_state.cs_api_eks.eks_cluster_cert_auth_data}"

  # IAM
  eks_node_role_arn  = "${data.terraform_remote_state.cs_api_eks.eks_node_role_arn}"
  codebuild_role_arn = "${data.terraform_remote_state.cs_api_cicd.codebuild_role_arn}"
}
