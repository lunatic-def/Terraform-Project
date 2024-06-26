output "dns_name" {
  description = "The DNS name of the load balancer"
  value       = module.nlb.dns_name
}

output "zone_id" {
  description = "The zone_id of the load balancer to assist with creating DNS records"
  value       = module.nlb.zone_id
}