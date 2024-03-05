module "bastion-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"
  depends_on = [ module.vpc]
  name = "bastion-instance"
  ami = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type
  key_name = var.instance_keypair
  user_data = file("${path.module}/jumpbox_install.sh") #use for checking the db connection 
  vpc_security_group_ids = [ module.bastion-secgroup.security_group_id]
  subnet_id =  module.vpc.public_subnets[0]
  tags = { name="bastion-instance"}
}