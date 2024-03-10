module "bastion-secgroup" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

#SSH -> 0.0.0.0/0
#HSM/EC2 -> Internal
  name        = "bastion-sg"
  description = "Security group which is used as an argument in complete-sg"
  vpc_id = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp"]
  # Connect to CloudHSM service internal
  ingress_with_cidr_blocks = [
  {
    from_port   = 2221
    to_port     = 2225
    protocol    = "-1"
    description = "Allow Port 2225 to connect to CloudHSM"
    cidr_blocks = module.vpc.vpc_cidr_block
  },
  ]
  egress_rules = ["all-all"]

    tags = {
    name = "Bastion Security Group"
  }
}