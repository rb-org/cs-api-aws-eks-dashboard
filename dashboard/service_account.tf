resource "kubernetes_service_account" "dashboard" {
  metadata {
    name      = "kubernetes-dashboard"
    namespace = "kube-system"

    labels {
      k8s-app = "kubernetes-dashboard"
    }
  }
}
