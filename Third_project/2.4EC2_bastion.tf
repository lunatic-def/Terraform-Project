module "bastion-instance" {
 
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"
  #depends_on = [ module.vpc, aws_internet_gateway.Internet_gw, aws_network_interface.bastion-net-interface,aws_eip.eip ] # need to wait for vpc to be created completely

  name = "bastion-instance"
  ami = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type
  key_name = var.instance_keypair

  availability_zone = module.vpc.azs[1] #us-east-1b
# network interface
  network_interface = [
    {
      device_index          = 0
      network_interface_id  = aws_network_interface.bastion-net-interface.id
      delete_on_termination = false
    }
  ]

  tags = { name="bastion-instance"}
}