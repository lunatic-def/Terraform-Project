module "us_nlb-secgroup" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"


  name        = "nlb-secgroup"
  description = "Security group which is used as an argument in complete-sg"
  vpc_id = module.us.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp","https-443-tcp"]
  egress_rules = ["all-all"]

    tags = {
    name = "US NLB Security Group"
  }
}

module "sa_nlb-secgroup" {
  depends_on = [ module.sa ]
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"


  name        = "nlb-secgroup"
  description = "Security group which is used as an argument in complete-sg"
  vpc_id = module.sa.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp","https-443-tcp"]
  egress_rules = ["all-all"]

    tags = {
    name = "SA NLB Security Group"
  }

  providers = {
    aws = aws.sa-east-1
  }
}