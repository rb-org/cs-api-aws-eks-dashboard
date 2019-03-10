resource "kubernetes_service" "dashboard" {
  metadata {
    name      = "${var.app_name}"
    namespace = "${var.namespace}"

    labels {
      k8s-app = "${var.app_name}"
    }
  }

  spec {
    selector {
      k8s-app = "${var.app_name}"
    }

    port {
      port        = 443
      target_port = 8443
    }
  }
}
