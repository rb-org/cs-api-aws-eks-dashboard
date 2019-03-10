variable "app_name" {
  default = "kubernetes-dashboard"
}

variable "namespace" {
  default = "kube-system"
}

variable "image" {
  default = "k8s.gcr.io/kubernetes-dashboard-amd64"
}

variable "image_ver" {
  default = "v1.10.1"
}
