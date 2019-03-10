provider "kubernetes" {
  host                   = "${data.terraform_remote_state.cs_api_eks.eks_cluster_endpoint}"
  cluster_ca_certificate = "${base64decode(data.terraform_remote_state.cs_api_eks.eks_cluster_cert_auth_data)}"
  token                  = "${data.aws_eks_cluster_auth.main.token}"
  load_config_file       = false
}

provider "aws" {
  version                 = "~>1.9"
  region                  = "${var.region}"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
  allowed_account_ids     = ["${var.account_id}"]
}
