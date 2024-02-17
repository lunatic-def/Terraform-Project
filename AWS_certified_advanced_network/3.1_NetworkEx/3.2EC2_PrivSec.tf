# Private 
#   Inbound: 22,cidr block
#   Outbound: all-all

module "private_security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"
  name = "Private security group"

  vpc_id = module.vpc.vpc_id
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]

  ingress_rules = ["ssh-tcp"]
  #egress_cidr_blocks = [module.vpc.vpc_cidr_block]
  egress_rules = ["all-all"]

  tags = {
    name = "Private Security Group"
  }

}