output "us_nlb" {
  description = "The DNS name of the load balancer"
  value       = module.us_nlb.dns_name
}

output "us_nlb_zone_id" {
  description = "The zone_id of the load balancer to assist with creating DNS records"
  value       = module.us_nlb.zone_id
}

output "sa_nlb" {
  description = "The DNS name of the load balancer"
  value       = module.sa_nlb.dns_name
}

output "sa_nlb_zone_id" {
  description = "The zone_id of the load balancer to assist with creating DNS records"
  value       = module.sa_nlb.zone_id
}