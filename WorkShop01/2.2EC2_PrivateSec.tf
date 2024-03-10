module "private-secgroup" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"


  name        = "private-sg"
  description = "Security group which is used as an argument in complete-sg"
  vpc_id = module.vpc.vpc_id

  
  ingress_rules       = ["http-8080-tcp", "ssh-tcp","http-80-tcp"]
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]

  egress_rules = ["all-all"]

    tags = {
    name = "Private Security Group"
  }
}