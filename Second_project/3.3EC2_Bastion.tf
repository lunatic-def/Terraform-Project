module "bastion-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"


  name = "bastion-instance"
  depends_on = [ module.vpc ] # need to wait for vpc to be created completely
  ami = data.aws_ami.amzlinux2023.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  #user_data = file("${path.module}/script.sh")
  #monitoring             = true
  vpc_security_group_ids = module.bastion_security-group.security_group_id
  #use for subnet [10.0.101.0/24", "10.0.102.0/24]
  subnet_id =  module.vpc.public_subnets[0]

  tags = {
    name = "Bastion Server"
  }
}