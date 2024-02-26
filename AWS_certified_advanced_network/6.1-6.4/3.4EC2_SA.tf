module "sa_server01" {
  # the module VPC create default Internet gateway for the Public subnet
  # SO no need to create route table for Bastion instance
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"

  name = "sa_server01"
  depends_on = [ module.sa ] # need to wait for vpc to be created completely
  ami = "ami-01bd314e606621640"
  instance_type          = var.instance_type
  #key_name               = var.instance_keypair
  vpc_security_group_ids = [module.sa_security-group.security_group_id]
  user_data = file("${path.module}/sa1.sh")
  subnet_id =  module.sa.public_subnets[0]
  tags = {
    name = "sa_server01"
  }

  providers = {
    aws = aws.sa-east-1
  }
}

module "sa_server02" {
  # the module VPC create default Internet gateway for the Public subnet
  # SO no need to create route table for Bastion instance
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"

  name = "sa_server02"
  depends_on = [ module.sa ] # need to wait for vpc to be created completely
  ami = "ami-01bd314e606621640"
  instance_type          = var.instance_type
  #key_name               = var.instance_keypair
  vpc_security_group_ids = [module.sa_security-group.security_group_id]
  user_data = file("${path.module}/sa2.sh")
  subnet_id =  module.sa.public_subnets[0]
  tags = {
    name = "sa_server02"
  }

  providers = {
    aws = aws.sa-east-1
  }
}
