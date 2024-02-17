module "bastion-instance" {
  # the module VPC create default Internet gateway for the Public subnet
  # SO no need to create route table for Bastion instance
  
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"


  name = "bastion-instance"
  depends_on = [ module.vpc ] # need to wait for vpc to be created completely
  ami = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  #monitoring             = true
  vpc_security_group_ids = [module.bastion_security-group.security_group_id]
  subnet_id =  module.vpc.public_subnets[0]

  tags = {
    name = "Bastion Server"
  }
}