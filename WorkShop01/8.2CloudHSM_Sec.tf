# module "HSM-secgroup" {
#   source  = "terraform-aws-modules/security-group/aws"
#   version = "5.1.0"


#   name        = "CloudHSM-sg"
#   description = "Security group which is used as an argument in complete-sg"
#   vpc_id = module.vpc.vpc_id

  
#   ingress_rules       = ["ssh-tcp"]
#   ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
#   # open port for HSM
#   ingress_with_cidr_blocks = [
#   {
#     from_port   = 2221
#     to_port     = 2225
#     protocol    = "-1"
#     description = "Allow Port 2225 to connect to CloudHSM"
#     cidr_blocks = module.vpc.vpc_cidr_block
#   },
#   ]
#   egress_rules = ["all-all"]

#     tags = {
#     name = "CloudHSM Security Group"
#   }
# }