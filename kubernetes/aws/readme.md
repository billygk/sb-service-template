# Deploy of infrastructure on aws

## What we will build 

- 1 VPC
- 2 public subnets, one per availability zone
- 2 private subnets, one per availability zone
- 2 private subnets, for database sql, nosql, etc
- NAT GW
- Routing tables
- a bastion server that will act as eks controller.

## Requisits

- AWS CLI
- Terraform 
- S3 bucket to sync state

We will use terraform state syncronication to an S3 bucket. More information: https://www.terraform.io/docs/language/settings/backends/s3.html


## Quick usage

#### Setup network and bastion host
```
cd terraform
$ terraform init
$ terraform plan
$ terraform apply
```

#### Prepare bastion host

Copy and execute k8s/aws/setup_bastion_host.sh in bastion host. 


