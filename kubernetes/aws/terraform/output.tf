output "region" {
  description = "AWS region"
  value       = var.region
}

output "vpc_id" {
  value       = module.vpc.vpc_id
}
output "vpc_cidr_block" {
  value       = module.vpc.vpc_cidr_block
}
output "nat_public_ips" {
  value       = module.vpc.nat_public_ips[0]
}

# Private subnets
output "private_subnets_1" {
  value       = module.vpc.private_subnets[0]
}
output "private_subnets_cidr_blocks_1" {
  value       = module.vpc.private_subnets_cidr_blocks[0]
}
output "private_subnets_2" {
  value       = module.vpc.private_subnets[1]
}
output "private_subnets_cidr_blocks_2" {
  value       = module.vpc.private_subnets_cidr_blocks[1]
}
#output "private_subnets_3" {
#  value       = module.vpc.private_subnets[2]
#}
#output "private_subnets_cidr_blocks_3" {
#  value       = module.vpc.private_subnets_cidr_blocks[2]
#}

# Public subnets
output "public_subnets_1" {
  value       = module.vpc.public_subnets[0]
}
output "public_subnets_cidr_blocks_1" {
  value       = module.vpc.public_subnets_cidr_blocks[0]
}
output "public_subnets_2" {
  value       = module.vpc.public_subnets[1]
}
output "public_subnets_cidr_blocks_2" {
  value       = module.vpc.public_subnets_cidr_blocks[1]
}
#output "public_subnets_3" {
#  value       = module.vpc.public_subnets[2]
#}
#output "public_subnets_cidr_blocks_3" {
#  value       = module.vpc.public_subnets_cidr_blocks[2]
#}

# DB Subnets
output "database_subnets_1" {
  value       = module.vpc.database_subnets[0]
}
output "database_subnets_cidr_blocks_1" {
  value       = module.vpc.database_subnets_cidr_blocks[0]
}
output "database_subnets_2" {
  value       = module.vpc.database_subnets[1]
}
output "database_subnets_cidr_blocks_2" {
  value       = module.vpc.database_subnets_cidr_blocks[1]
}
#output "database_subnets_3" {
#  value       = module.vpc.database_subnets[2]
#}
#output "database_subnets_cidr_blocks_3" {
#  value       = module.vpc.database_subnets_cidr_blocks[2]
#}

# elasticache subnets
output "elasticache_subnets_1" {
  value       = module.vpc.elasticache_subnets[0]
}
output "elasticache_subnets_cidr_blocks_1" {
  value       = module.vpc.elasticache_subnets_cidr_blocks[0]
}
output "elasticache_subnets_2" {
  value       = module.vpc.elasticache_subnets[1]
}
output "elasticache_subnets_cidr_blocks_2" {
  value       = module.vpc.elasticache_subnets_cidr_blocks[1]
}
#output "elasticache_subnets_3" {
#  value       = module.vpc.elasticache_subnets[2]
#}
#output "elasticache_subnets_cidr_blocks_3" {
#  value       = module.vpc.elasticache_subnets_cidr_blocks[2]
#}

# Bastion host
output "bastion_public_ip" {
  value       = aws_eip.bastion_eip.public_ip
}

