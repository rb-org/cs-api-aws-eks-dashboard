resource "kubernetes_secret" "dashboard" {
  metadata {
    name      = "${var.app_name}-certs"
    namespace = "${var.namespace}"

    labels {
      k8s-app = "${var.app_name}"
    }
  }

  type = "Opaque"
}
