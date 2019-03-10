# Terraform - CS API - AWS EKS Dashboard

## Build Status

| Branch | Status |
|:---:|:---:|
| master |[![CircleCI](https://circleci.com/gh/rb-org/cs-api-aws-eks-dashboard/tree/master.svg?style=svg&circle-token=c0f27697321d85680106a3aae1c677f54e8ec876)](https://circleci.com/gh/rb-org/cs-api-aws-eks-dashboard/tree/master)|
| test |[![CircleCI](https://circleci.com/gh/rb-org/cs-api-aws-eks-dashboard/tree/uat.svg?style=svg&circle-token=c0f27697321d85680106a3aae1c677f54e8ec876)](https://circleci.com/gh/rb-org/cs-api-aws-eks-dashboard/tree/uat)|
| dev |[![CircleCI](https://circleci.com/gh/rb-org/cs-api-aws-eks-dashboard/tree/dev.svg?style=svg&circle-token=c0f27697321d85680106a3aae1c677f54e8ec876)](https://circleci.com/gh/rb-org/cs-api-aws-eks-dashboard/tree/dev)|

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| account\_id | AWS Account ID | string | `""` | no |
| default\_tags | Map of default tags applied to all resources | map | `<map>` | no |
| region | AWS Region | string | `""` | no |
| remote\_state\_s3 |  | string | `"xyz-tfm-state"` | no |