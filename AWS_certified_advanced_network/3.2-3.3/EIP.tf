resource "aws_eip" "provider_eip" {
  domain = "vpc"
  #network_interface         = aws_network_interface.NetworkEIP.id
  depends_on = [module.Provider] # waint for the creation of VPC and EC2 first
  instance = module.Provider-bastion.id # assign to bastion instance
  tags = { name = "Provider_EIP"}
}

resource "aws_eip" "cosumer_eip" {
  domain = "vpc"
  #network_interface         = aws_network_interface.NetworkEIP.id
  depends_on = [module.Consumer] # waint for the creation of VPC and EC2 first
  instance = module.Consumer-bastion.id # assign to bastion instance
  tags = { name = "Consumer_EIP"}
}