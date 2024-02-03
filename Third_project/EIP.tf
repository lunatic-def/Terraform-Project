
# bastion instance network interface use this if you don't want to use NAT gateway ;) 
resource "aws_network_interface" "bastion-net-interface" {
  subnet_id       = module.vpc.public_subnets[1] #10.0.102.0/24
  private_ips     = ["10.0.102.50"] # assign static IP for bastion network interface
  security_groups = [module.bastion-secgroup.security_group_id]
# Assign public IP (EIP) 
}

resource "aws_eip" "eip" {
  depends_on = [ module.bastion-instance, module.vpc]
  tags = {name="eip"}

  instance = module.bastion-instance.id
  domain = "vpc"
  associate_with_private_ip = "10.0.102.50"

}
output "server_public_ip" {
  value = aws_eip.eip
}
