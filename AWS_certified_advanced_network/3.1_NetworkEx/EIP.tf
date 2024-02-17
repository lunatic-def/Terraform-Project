resource "aws_eip" "EIP" {
  domain = "vpc"
  #network_interface         = aws_network_interface.NetworkEIP.id
  depends_on = [module.vpc, module.bastion-instance] # waint for the creation of VPC and EC2 first
  instance = module.bastion-instance.id # assign to bastion instance
  tags = { name = "EIP"}
}