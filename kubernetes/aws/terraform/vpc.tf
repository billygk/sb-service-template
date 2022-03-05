provider "aws" {
  region = var.region
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~>3.12.0"

  name                 = var.vpc_name
  cidr                 = "10.10.0.0/16"

  azs                  = ["us-east-2a", "us-east-2b"]
  private_subnets      = ["10.10.11.0/24", "10.10.12.0/24"]
  public_subnets       = ["10.10.1.0/24", "10.10.2.0/24"]

  create_database_subnet_group = true
  database_subnets     = ["10.10.21.0/24","10.10.22.0/24"]

  create_elasticache_subnet_group = false
  elasticache_subnets  = ["10.10.31.0/24","10.10.32.0/24"]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  # For EKS load balancer tags
  tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }
}