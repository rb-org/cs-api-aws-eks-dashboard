variable "region" {
  description = "AWS Region"
  default     = ""
}

variable "account_id" {
  description = "AWS Account ID"
  default     = ""
}

variable "default_tags" {
  type        = "map"
  description = "Map of default tags applied to all resources"

  default = {
    Github-Repo = "rb-org/cs-api-aws-eks-dashboard"
    Terraform   = "true"
  }
}

variable "remote_state_s3" {
  default = "xyz-tfm-state"
}
