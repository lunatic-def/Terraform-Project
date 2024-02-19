# Pulic
#   Inbound: 22,cidr block,Internet GW -> assign EIP
#   Outbound: all-all


module "vpc1_publicSec" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"
  name = "Public security group"

  vpc_id = module.vpc1.vpc_id

  # internal and external connection
  ingress_cidr_blocks = ["0.0.0.0/0"]

  ingress_rules = ["ssh-tcp"]
  egress_rules = ["all-all"]

  tags = {
    name = "Public Security Group"
  }
}

module "vpc2_publicSec" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"
  name = "Public security group"

  vpc_id = module.vpc2.vpc_id

  # internal and external connection
  ingress_with_cidr_blocks = [{
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    description = "Allow ping"
    cidr_blocks = "0.0.0.0/0"
  },
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "Allow SSH"
    cidr_blocks = "0.0.0.0/0"
  }
  ]
  egress_rules = ["all-all"]

  tags = {
    name = "Public Security Group"
  }

}

module "vpc3_publicSec" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"
  name = "Public security group"

  vpc_id = module.vpc3.vpc_id

  # internal and external connection
  ingress_cidr_blocks = ["0.0.0.0/0"]

  ingress_rules = ["ssh-tcp"]
  egress_rules = ["all-all"]

  tags = {
    name = "Public Security Group"
  }

}