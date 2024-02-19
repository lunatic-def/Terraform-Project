module "vpc1-instance" {
  # the module VPC create default Internet gateway for the Public subnet
  # SO no need to create route table for Bastion instance
  
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"


  name = "public-instance"
  depends_on = [ module.vpc1 ] # need to wait for vpc to be created completely
  ami = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  #monitoring             = true
  vpc_security_group_ids = [module.vpc1_publicSec.security_group_id]
  subnet_id =  module.vpc1.public_subnets[0]

  tags = {
    name = "Public Server"
  }
}
module "vpc2-instance" {
  # the module VPC create default Internet gateway for the Public subnet
  # SO no need to create route table for Bastion instance
  
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"


  name = "public-instance"
  depends_on = [ module.vpc2 ] # need to wait for vpc to be created completely
  ami = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  #monitoring             = true
  vpc_security_group_ids = [module.vpc2_publicSec.security_group_id]
  subnet_id =  module.vpc2.public_subnets[0]

  tags = {
    name = "Public Server"
  }
}

module "vpc3-instance" {
  # the module VPC create default Internet gateway for the Public subnet
  # SO no need to create route table for Bastion instance
  
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"


  name = "public-instance"
  depends_on = [ module.vpc3 ] # need to wait for vpc to be created completely
  ami = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  #monitoring             = true
  vpc_security_group_ids = [module.vpc3_publicSec.security_group_id]
  subnet_id =  module.vpc3.public_subnets[0]

  tags = {
    name = "Public Server"
  }
}


