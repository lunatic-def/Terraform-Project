resource "aws_eip" "eip_vpc1" {
  domain = "vpc"
  #network_interface         = aws_network_interface.NetworkEIP.id
  depends_on = [module.vpc1] # waint for the creation of VPC and EC2 first
  instance = module.vpc1-instance.id # assign to bastion instance
  tags = { name = "EIP"}
}