module "alb-secgroup" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"


  name        = "bastion-sg"
  description = "Security group which is used as an argument in complete-sg"
  vpc_id = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp"]
  egress_rules = ["all-all"]

    tags = {
    name = "Bastion Security Group"
  }
}