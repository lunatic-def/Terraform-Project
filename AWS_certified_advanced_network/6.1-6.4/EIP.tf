resource "aws_eip" "us_server01_eip" {
  domain = "vpc"
  #network_interface         = aws_network_interface.NetworkEIP.id
  depends_on = [module.us] # waint for the creation of VPC and EC2 first
  instance = module.us_server01.id # assign to bastion instance
  tags = { name = "us_server01_eip"}
}
resource "aws_eip" "us_server02_eip" {
  domain = "vpc"
  #network_interface         = aws_network_interface.NetworkEIP.id
  depends_on = [module.us] # waint for the creation of VPC and EC2 first
  instance = module.us_server02.id # assign to bastion instance
  tags = { name = "us_server02_eip"}
}

resource "aws_eip" "sa_server01_eip" {
  domain = "vpc"
  #network_interface         = aws_network_interface.NetworkEIP.id
  depends_on = [module.sa] # waint for the creation of VPC and EC2 first
  instance = module.sa_server01.id # assign to bastion instance
  tags = { name = "sa_server01_eip"}
provider = aws.sa-east-1
  
}
resource "aws_eip" "sa_server02_eip" {
  domain = "vpc"
  #network_interface         = aws_network_interface.NetworkEIP.id
  depends_on = [module.sa] # waint for the creation of VPC and EC2 first
  instance = module.sa_server02.id # assign to bastion instance
  tags = { name = "sa_server02_eip"}
provider = aws.sa-east-1
}
