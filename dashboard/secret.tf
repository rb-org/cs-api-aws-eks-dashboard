resource "kubernetes_secret" "dashboard" {
  metadata {
    name      = "kubernetes-dashboard-certs"
    namespace = "kube-system"

    labels {
      k8s-app = "kubernetes-dashboard"
    }
  }

  type = "Opaque"
}
