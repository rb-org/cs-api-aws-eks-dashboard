resource "kubernetes_role" "dashboard" {
  metadata {
    name      = "kubernetes-dashboard-minimal"
    namespace = "kube-system"
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
    api_groups    = [""]
    resources     = ["secrets"]
    resourceNames = ["kubernetes-dashboard-key-holder", "kubernetes-dashboard-certs"]
    verbs         = ["get", "update", "delete"]
  }

  # Allow Dashboard to get and update 'kubernetes-dashboard-settings' config map.
  rule {
    api_groups    = [""]
    resources     = ["configmaps"]
    resourceNames = ["kubernetes-dashboard-settings"]
    verbs         = ["get", "update"]
  }

  # Allow Dashboard to get metrics from heapster.
  rule {
    api_groups    = [""]
    resources     = ["services"]
    resourceNames = ["heapster"]
    verbs         = ["proxy"]
  }

  rule {
    api_groups    = [""]
    resources     = ["services/proxxy"]
    resourceNames = ["heapster", "http:heapster:", "https:heapster:"]
    verbs         = ["get"]
  }
}
