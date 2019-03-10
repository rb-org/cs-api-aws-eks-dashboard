# resource "kubernetes_config_map" "main" {
#   metadata {
#     name      = "aws-auth"
#     namespace = "kube-system"
#   }
#   data {
#     mapRoles = {
#       rolearn  = "${var.eks_node_role_arn}"
#       username = "system:node:{{EC2PrivateDNSName}}"
#       groups = {
#         system = "bootstrappers"
#         system = "nodes"
#       }
#     }
#     mapRoles = {
#       rolearn  = "${var.codebuild_role_arn}"
#       username = "build"
#       groups = {
#         system = "masters"
#       }
#     }
#   }
#   depends_on = [
#     "aws_eks_cluster.main",
#   ]
# }
resource "kubernetes_config_map" "iam_nodes_config_map" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data {
    mapRoles = <<ROLES
- rolearn: ${var.eks_node_role_arn}
  username: system:node:{{EC2PrivateDNSName}}
  groups:
    - system:bootstrappers
    - system:nodes
- rolearn: ${var.codebuild_role_arn}
  username: build
  groups:
    - system:masters
ROLES
  }

  # depends_on = [
  #   "aws_eks_cluster.main",
  #   "null_resource.kube_cfg",
  # ]
}
