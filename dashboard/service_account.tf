resource "kubernetes_service_account" "dashboard" {
  metadata {
    name      = "${var.app_name}"
    namespace = "${var.namespace}"

    labels {
      k8s-app = "${var.app_name}"
    }
  }
}
