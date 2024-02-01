module "private-instances" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"


  name = "private-instance"
  depends_on = [ module.vpc ] # need to wait for vpc to be created completely
  ami = data.aws_ami.amzlinux2023.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  user_data = file("${path.module}/script.sh")
  #monitoring             = true
  vpc_security_group_ids = module.private_security-group.security_group_id

  #use for subnet [10.0.1.0/24,10.0.2.0/24]
  for_each = toset(["0", "1"]) #create multiple EC2 instances in each subnet
  subnet_id =  element(module.vpc.private_subnets, tonumber(each.key))

  tags = {
    name = "Web_Server"
  }
}