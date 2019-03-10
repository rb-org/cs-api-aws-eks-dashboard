resource "kubernetes_cluster_role_binding" "main" {
  metadata {
    name = "eks-admin"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "eks-admin"
    namespace = "kube-system"
  }

  depends_on = [
    "kubernetes_service_account.eks_admin",
  ]
}
