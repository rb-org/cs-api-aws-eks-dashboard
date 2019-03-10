resource "kubernetes_deployment" "dashboard" {
  metadata {
    name      = "${var.app_name}-certs"
    namespace = "${var.namespace}"

    labels {
      k8s-app = "${var.app_name}"
    }
  }

  spec {
    replicas               = 1
    revision_history_limit = 10

    selector {
      match_labels {
        k8s-app = "${var.app_name}"
      }
    }

    template {
      metadata {
        labels {
          k8s-app = "${var.app_name}"
        }
      }

      spec {
        service_account_name = "${kubernetes_service_account.dashboard.metadata.name}"

        container {
          image = "${var.image}:${var.image_ver}"
          name  = "${var.app_name}"

          port {
            container_port = 8443
            protocol       = "TCP"
          }

          args = ["--auto-generate-certificates"]

          volume_mount {
            name       = "${var.app_name}-certs"
            mount_path = "/certs"
          }

          volume_mount {
            name       = "tmp-volume"
            mount_path = "/tmp"
          }

          liveness_probe {
            http_get {
              scheme = "HTTPS"
              path   = "/"
              port   = 8443
            }
          }
        }

        volume {
          name = "${var.app_name}-certs"

          secret {
            secret_name = "${kubernetes_secret.dashboard.metadata.name}"
          }
        }

        volume {
          name      = "tmp-volume"
          empty_dir = {}
        }

        # toleration {
        #   key    = "node-role.kubernetes.io/master"
        #   effect = "NoSchedule"
        # }
      }
    }
  }
}
