# Terraform AWS Network Load Balancer (NLB)
module "sa_nlb" {
  depends_on = [ module.sa ]
  source  = "terraform-aws-modules/alb/aws"
  version = "9.4.0"
  internal = false #internet facing nlb
  name_prefix = "mynlb-"
  load_balancer_type               = "network"
  vpc_id                           = module.sa.vpc_id
  dns_record_client_routing_policy = "availability_zone_affinity"
  security_groups = [module.sa_nlb-secgroup.security_group_id]

  # https://github.com/hashicorp/terraform-provider-aws/issues/17281
  subnets = module.sa.public_subnets

  # For example only
  enable_deletion_protection = false

# Listeners
  listeners = {
    # Listener-1: TCP Listener
    my-tcp = {
      port     = 80
      protocol = "TCP"
      forward = {
        target_group_key = "mytg1"
      }
    }# End Listener-1: TCP Listener

    my-tcp2 = {
      port     = 443
      protocol = "TCP"
      forward = {
        target_group_key = "mytg1"
      }
    }# End Listener-1: TCP Listener
  }# End Listeners Block

# Target Groups
  target_groups = { 
    # Target Group-1: mytg1
    mytg1 = {
      create_attachment = false        
      name_prefix          = "mytg1-"
      protocol             = "TCP"
      port                 = 80
      target_type          = "instance"
      deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
      }# End Health Check Block
    }# End Target Group-1: mytg1
  }

 providers = {
    aws = aws.sa-east-1
  }
}# End NLB Module

resource "aws_lb_target_group_attachment" "test3" {
  depends_on = [ module.sa_nlb ]
  target_group_arn = module.sa_nlb.target_groups["mytg1"].arn
  target_id       = module.sa_server01.id
  port             = 80
  provider = aws.sa-east-1
}

resource "aws_lb_target_group_attachment" "test4" {
  depends_on = [ module.sa_nlb ]
  target_group_arn = module.sa_nlb.target_groups["mytg1"].arn
  target_id       = module.sa_server02.id
  port             = 80
  provider = aws.sa-east-1
}