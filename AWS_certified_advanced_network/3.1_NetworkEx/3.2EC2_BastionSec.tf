# Pulic
#   Inbound: 22,cidr block,Internet GW -> assign EIP
#   Outbound: all-all


module "bastion_security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"
  name = "Bastion security group"

  vpc_id = module.vpc.vpc_id

  # internal and external connection
  ingress_cidr_blocks = ["0.0.0.0/0"]

  ingress_rules = ["ssh-tcp"]
  egress_rules = ["all-all"]

  tags = {
    name = "Bastion Security Group"
  }

}