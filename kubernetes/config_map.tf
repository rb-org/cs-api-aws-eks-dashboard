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
}
