# VPC ID
output "Provider_id" {
  description = "The ID of the VPC Provider"
  value       = module.Provider.vpc_id
}

output "Consumer_id" {
  description = "The ID of the VPC Consumer"
  value       = module.Consumer.vpc_id
}
# # VPC Private Subnets
# output "private_subnets" {
#   description = "List of IDs of private subnets"
#   value       = module.vpc.private_subnets
# }

# VPC Public Subnets
output "Provider_public_subnets1" {
  description = "Provider public subnets"
  value       = module.Provider.public_subnets
}

output "Consumer_public_subnets2" {
  description = "Consumer public subnets"
  value       = module.Consumer.public_subnets
}


output "Provider_public_route_table_ids" {
  description = "Provider public route tables"
  value       = module.Provider.public_route_table_ids
}

output "Consumer_public_route_table_ids" {
  description = "Consumer public route tables"
  value       = module.Consumer.public_route_table_ids
}


# output "private_route_table_ids" {
#   description = "List of IDs of private route tables"
#   value       = module.vpc.private_route_table_ids[0]
# }


# # VPC NAT gateway Public IP
# output "nat_public_ips" {
#   description = "List of public Elastic IPs created for AWS NAT Gateway"
#   value       = module.vpc.nat_public_ips
# }
