# Pulic
#   Inbound: 22,cidr block,Internet GW -> assign EIP
#   Outbound: all-all


module "us_security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"
  name = "Public security group"

  vpc_id = module.us.vpc_id

  # internal and external connection
  ingress_cidr_blocks = ["0.0.0.0/0"]

  ingress_rules = ["ssh-tcp","http-80-tcp","https-443-tcp"]
  egress_rules = ["all-all"]

  tags = {
    name = "Public Security Group"
  }

}

module "sa_security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"
  name = "Public security group"

  vpc_id = module.sa.vpc_id

  # internal and external connection
  ingress_cidr_blocks = ["0.0.0.0/0"]

  ingress_rules = ["ssh-tcp","https-443-tcp","http-80-tcp"]
  egress_rules = ["all-all"]

  providers = {
    aws = aws.sa-east-1
  }

  tags = {
    name = "Public Security Group"}
  
}