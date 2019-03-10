terraform {
  required_version = "~>0.11.11"

  backend "s3" {
    bucket                  = "xyz-tfm-state"
    region                  = "eu-west-1"
    key                     = "cs-api-eks-dashboard.tfstate"
    encrypt                 = "true"
    shared_credentials_file = "~/.aws/credentials"
    profile                 = "default"
  }
}

data "terraform_remote_state" "cs_api_eks" {
  backend = "s3"

  config {
    bucket = "${var.remote_state_s3}"
    region = "eu-west-1"
    key    = "env:/${terraform.workspace}/cs-api-eks.tfstate"
  }
}

data "terraform_remote_state" "cs_api_cicd" {
  backend = "s3"

  config {
    bucket = "${var.remote_state_s3}"
    region = "eu-west-1"
    key    = "env:/${terraform.workspace}/cs-api-cicd.tfstate"
  }
}
