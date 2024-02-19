# # VPC ID
# output "vpc_id" {
#   description = "The ID of the VPC"
#   value       = module.vpc.vpc_id
# }
# # VPC Private Subnets
# output "private_subnets" {
#   description = "List of IDs of private subnets"
#   value       = module.vpc.private_subnets
# }

# # VPC Public Subnets
# output "public_subnets" {
#   description = "List of IDs of public subnets"
#   value       = module.vpc1.public_subnets
# }

# # VPC AZs
# output "azs" {
#   description = "A list of availability zones spefified as argument to this module"
#   value       = module.vpc1.azs
# }


# output "default_route_table_id" {
#   description = "The ID of the default route table"
#   value       = module.vpc1.default_route_table_id
# }

output "vpc1_public_route_table_ids" {
  description = "List of IDs of public route tables"
  value       = module.vpc1.public_route_table_ids
}

output "vpc2_public_route_table_ids" {
  description = "List of IDs of public route tables"
  value       = module.vpc2.public_route_table_ids
}

output "vpc3_public_route_table_ids" {
  description = "List of IDs of public route tables"
  value       = module.vpc3.public_route_table_ids
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
