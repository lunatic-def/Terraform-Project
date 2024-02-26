module "us_server01" {
  # the module VPC create default Internet gateway for the Public subnet
  # SO no need to create route table for Bastion instance
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"

  name = "us_server01"
  depends_on = [ module.us ] # need to wait for vpc to be created completely
  ami = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  vpc_security_group_ids = [module.us_security-group.security_group_id]
  user_data = file("${path.module}/us1.sh")
  subnet_id =  module.us.public_subnets[0]
  tags = {
    name = "us_server02"
  }
}

module "us_server02" {
  # the module VPC create default Internet gateway for the Public subnet
  # SO no need to create route table for Bastion instance
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"

  name = "us_server02"
  depends_on = [ module.us ] # need to wait for vpc to be created completely
  ami = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  user_data = file("${path.module}/us2.sh")
  vpc_security_group_ids = [module.us_security-group.security_group_id]
  
  subnet_id =  module.us.public_subnets[0]
  tags = {
    name = "us_server02"
  }
}