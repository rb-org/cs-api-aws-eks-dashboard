resource "kubernetes_deployment" "dashboard" {
  metadata {
    name      = "kubernetes-dashboard-certs"
    namespace = "kube-system"

    labels {
      k8s-app = "kubernetes-dashboard"
    }
  }

  spec {
    replicas               = 1
    revision_history_limit = 10

    selector {
      match_labels {
        k8s-app = "kubernetes-dashboard"
      }
    }

    template {
      metadata {
        labels {
          k8s-app = "kubernetes-dashboard"
        }
      }

      spec {
        container {
          image                = "k8s.gcr.io/kubernetes-dashboard-amd64:v1.10.1"
          name                 = "kubernetes-dashboard"
          service_account_name = "${kubernetes_service_account.dashboard.name}"

          ports {
            container_port = 8443
            protocol       = "TCP"
          }

          args = "--auto-generate-certificates"

          volume_mount {
            name       = "kubernetes-dashboard-certs"
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
          name = "kubernetes-dashboard-certs"

          secret {
            secret_name = "${kubernetes_secret.dashboard.name}"
          }
        }

        volume {
          name      = "tmp-volume"
          empty_dir = "{}"
        }

        tolerations {
          key    = "node-role.kubernetes.io/master"
          effect = "NoSchedule"
        }
      }
    }
  }
}

# kind: Deployment
# apiVersion: apps/v1
# metadata:
#   labels:
#     k8s-app: kubernetes-dashboard
#   name: kubernetes-dashboard
#   namespace: kube-system
# spec:
#   replicas: 1
#   revisionHistoryLimit: 10
#   selector:
#     matchLabels:
#       k8s-app: kubernetes-dashboard
#   template:
#     metadata:
#       labels:
#         k8s-app: kubernetes-dashboard
#     spec:
#       containers:
#       - name: kubernetes-dashboard
#         image: k8s.gcr.io/kubernetes-dashboard-amd64:v1.10.1
#         ports:
#         - containerPort: 8443
#           protocol: TCP
#         args:
#           - --auto-generate-certificates
#           # Uncomment the following line to manually specify Kubernetes API server Host
#           # If not specified, Dashboard will attempt to auto discover the API server and connect
#           # to it. Uncomment only if the default does not work.
#           # - --apiserver-host=http://my-address:port
#         volumeMounts:
#         - name: kubernetes-dashboard-certs
#           mountPath: /certs
#           # Create on-disk volume to store exec logs
#         - mountPath: /tmp
#           name: tmp-volume
#         livenessProbe:
#           httpGet:
#             scheme: HTTPS
#             path: /
#             port: 8443
#           initialDelaySeconds: 30
#           timeoutSeconds: 30
#       volumes:
#       - name: kubernetes-dashboard-certs
#         secret:
#           secretName: kubernetes-dashboard-certs
#       - name: tmp-volume
#         emptyDir: {}
#       serviceAccountName: kubernetes-dashboard
#       # Comment the following tolerations if Dashboard must not be deployed on master
#       tolerations:
#       - key: node-role.kubernetes.io/master
#         effect: NoSchedule

