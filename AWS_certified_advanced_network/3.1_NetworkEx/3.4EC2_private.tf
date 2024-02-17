module "private-instances" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"

  name = "private-instance"
  depends_on = [ module.vpc ] # need to wait for vpc to be created completely
  ami = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  # user_data = file("${path.module}/script.sh")
  #monitoring             = true
  vpc_security_group_ids = [module.private_security-group.security_group_id]

  subnet_id = module.vpc.private_subnets[0]

  tags = {
    name = "Web_Server"
  }
}