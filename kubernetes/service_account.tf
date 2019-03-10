resource "kubernetes_service_account" "eks_admin" {
  metadata {
    name      = "eks-admin"
    namespace = "kube-system"
  }
}
