# DNS Registration

# 6.3
#Simple routing policy
resource "aws_route53_record" "apps_dns" {
  zone_id = data.aws_route53_zone.mydomain.zone_id 
  name    = "apps.langocanh.net"
  type    = "A"
  alias {
    name                   = module.alb.dns_name
    zone_id                = module.alb.zone_id
    evaluate_target_health = true
  }  
}

#6.4
# # Weighted routing policy
# resource "aws_route53_record" "apps_dns" {
#   zone_id = data.aws_route53_zone.mydomain.zone_id
#   name    = "developer.langocanh.net"
#   records        = ["developer.langocanh.net"]
#   type    = "A"
#   alias {
#     name                   = module.us_nlb.dns_name
#     zone_id                = module.us_nlb.zone_id
#     evaluate_target_health = true
#   }  

#   weighted_routing_policy {
#     weight = 30
#   }

#   set_identifier = "us_zone"
# }

# resource "aws_route53_record" "www-live" {
#   zone_id = data.aws_route53_zone.mydomain.zone_id
#   name    = "developer.langocanh.net"
#   records        = ["developer.langocanh.net"]
#   type    = "A"
#   alias {
#     name                   = module.sa_nlb.dns_name
#     zone_id                = module.sa_nlb.zone_id
#     evaluate_target_health = true
#   }
#   weighted_routing_policy {
#     weight = 70
#   }
#   set_identifier = "sa_zone"
# }