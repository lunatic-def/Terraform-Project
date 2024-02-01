# Private 
#   Inbound: 22,80,cidr block
#   Outbound: all-all

module "private_security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  vpc_id = modue.vpc_id
  ingress_cidr_blocks = module.vpc.vpc_cidr_block

  ingress_rules = ["ssh-tcp","http-80-tcp"]
  egress_rules = ["all-all"]

  tags = {
    name = "Private Security Group"
  }

}