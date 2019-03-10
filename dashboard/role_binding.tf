resource "kubernetes_role_binding" "dashboard" {
  metadata {
    name      = "${var.app_name}-minimal"
    namespace = "${var.namespace}"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = "${var.app_name}-minimal"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "${var.app_name}"
    namespace = "${var.namespace}"
  }
}
