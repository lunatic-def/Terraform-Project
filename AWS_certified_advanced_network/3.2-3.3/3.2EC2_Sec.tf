# Pulic
#   Inbound: 22,cidr block,Internet GW -> assign EIP
#   Outbound: all-all


module "provider_security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"
  name = "Public security group"

  vpc_id = module.Provider.vpc_id

  # internal and external connection
  ingress_cidr_blocks = ["0.0.0.0/0"]

  ingress_rules = ["ssh-tcp","http-80-tcp"]
  egress_rules = ["all-all"]

  tags = {
    name = "Public Security Group"
  }

}

module "consumer_security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"
  name = "Public security group"

  vpc_id = module.Consumer.vpc_id

  # internal and external connection
  ingress_cidr_blocks = ["0.0.0.0/0"]

  ingress_rules = ["ssh-tcp"]
  egress_rules = ["all-all"]

  tags = {
    name = "Public Security Group"}
}