resource "kubernetes_service_account" "eks_admin" {
  metadata {
    name      = "eks-admin"
    namespace = "kube-system"
  }

  # depends_on = [
  #   "null_resource.kube_cfg",
  #   "aws_eks_cluster.main",
  # ]
}
