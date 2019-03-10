resource "kubernetes_role" "dashboard" {
  metadata {
    name      = "${var.app_name}-minimal"
    namespace = "${var.namespace}"
  }

  # Allow Dashboard to create 'kubernetes-dashboard-key-holder' secret.
  rule {
    api_groups = [""]
    resources  = ["secrets"]
    verbs      = ["create"]
  }

  # Allow Dashboard to create 'kubernetes-dashboard-settings' config map.
  rule {
    api_groups = [""]
    resources  = ["configmaps"]
    verbs      = ["create"]
  }

  # Allow Dashboard to get, update and delete Dashboard exclusive secrets.
  rule {
    api_groups     = [""]
    resources      = ["secrets"]
    resource_names = ["${var.app_name}-key-holder", "${var.app_name}-certs"]
    verbs          = ["get", "update", "delete"]
  }

  # Allow Dashboard to get and update 'kubernetes-dashboard-settings' config map.
  rule {
    api_groups     = [""]
    resources      = ["configmaps"]
    resource_names = ["${var.app_name}-settings"]
    verbs          = ["get", "update"]
  }

  # Allow Dashboard to get metrics from heapster.
  rule {
    api_groups     = [""]
    resources      = ["services"]
    resource_names = ["heapster"]
    verbs          = ["proxy"]
  }

  rule {
    api_groups     = [""]
    resources      = ["services/proxxy"]
    resource_names = ["heapster", "http:heapster:", "https:heapster:"]
    verbs          = ["get"]
  }
}
