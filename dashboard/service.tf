resource "kubernetes_service" "dashboard" {
  metadata {
    name      = "kubernetes-dashboard"
    namespace = "kube-system"

    labels {
      k8s-app = "kubernetes-dashboard"
    }
  }

  spec {
    selector {
      k8s-app = "kubernetes-dashboard"
    }

    port {
      port        = 443
      target_port = 8443
    }
  }
}

# apiVersion: v1
# metadata:
#   labels:
#     k8s-app: kubernetes-dashboard
#   name: kubernetes-dashboard
#   namespace: kube-system
# spec:
#   ports:
#     - port: 443
#       targetPort: 8443
#   selector:
#     k8s-app: kubernetes-dashboard

