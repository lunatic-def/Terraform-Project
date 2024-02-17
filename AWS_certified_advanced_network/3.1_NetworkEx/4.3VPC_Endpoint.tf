################################################################################
# VPC Endpoints Module
################################################################################
module "vpc_endpoints" {
  depends_on = [ module.vpc, module.private-instances ]
  source  = "terraform-aws-modules/vpc/aws//modules/vpc-endpoints"
  version = "5.5.2"
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  #subnet_ids = [module.vpc.private_subnets[0]]

  create_security_group      = true
  security_group_name_prefix = "S3-vpc-endpoints"
  security_group_description = "VPC endpoint security group"
  security_group_rules = {
    ingress = {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "HTTP from VPC"
      cidr_blocks = [var.cidr]
    }
  }

  endpoints = {
    s3 = {
      service             = "s3"
      private_dns_enabled = false
      service_type    = "Gateway"
      # assign to private instance route table
      route_table_ids = [module.vpc.private_route_table_ids[0]]
      policy = jsonencode(local.statement)
      tags = { Name = "s3-vpc-endpoint" }
    }
  }

  tags = {
    name = " VPC S3 endpoint"
  
  }
}