/*
1) Create VPC
2) Internet GW
3) Route table
4) Subnet 
5) Associate the subnet with the route table
6) Create Security group to allow 22,80,443
7) Create network interface with an ip in the subnet
8) Assign elastic IP to the network interface 
9) Create ubuntu server and install apache22
*/
# Configure the AWS Provider
#Authentication
provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

# Create a VPC=======================================================
resource "aws_vpc" "First_VPC" {
 cidr_block = "10.0.0.0/16"
 tags = {
    Name = "VPC_10"
  }
}
# create subnet within the VPC=======================================
resource "aws_subnet" "FirstVPC_Sub1" {
  vpc_id     = aws_vpc.First_VPC.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "VPC_10"
  }
}
#Internet gateway====================================================
resource "aws_internet_gateway" "Internet_gw" {
  vpc_id = aws_vpc.First_VPC.id
  tags = {
    Name = "VPC_10"
  }
}

#route table ========================================================
resource "aws_route_table" "RouteTable" {
  vpc_id = aws_vpc.First_VPC.id

  route {
    cidr_block = "0.0.0.0/0" #send all traffic to internet 
    gateway_id = aws_internet_gateway.Internet_gw.id
  }
  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.Internet_gw.id
  }
  tags = {
    Name = "VPC_10"
  }
}

# assign the route table for the subnet
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.FirstVPC_Sub1.id
  route_table_id = aws_route_table.RouteTable.id
}

#Security group======================================================
resource "aws_security_group" "allow_web" {
  name        = "allow_web"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.First_VPC.id
  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #any ip address
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
#outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # any protocol
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web Firewall"
  }
}

#network interface using EIP===================================================
resource "aws_network_interface" "NetworkEIP" {
  subnet_id       = aws_subnet.FirstVPC_Sub1.id
  private_ips     = ["10.0.1.50"]
  security_groups = [aws_security_group.allow_web.id]
# Assign public IP (EIP) 
}
# network EIP
resource "aws_eip" "EIP" {
  vpc                       = true
  network_interface         = aws_network_interface.NetworkEIP.id
  associate_with_private_ip = "10.0.1.50"
  depends_on = [aws_internet_gateway.Internet_gw] # Internet gw
}
output "server_public_ip" {
  value = aws_eip.EIP.public_ip
}

#create EC2 (t2.micro, ami-06aa3f7caf3a30282)==================================
resource "aws_instance" "webserver" {
  ami           = "ami-06aa3f7caf3a30282"
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  key_name = "Webkey"
  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.NetworkEIP.id
  }
user_data = <<EOF
		            #!/bin/bash
                sudo apt update -y
                sudo apt install apache2 -y
                sudo systemctl start apache2
                sudo bash -c 'echo your very first web server > /var/www/html/index.html'
                EOF
  tags = {
    Name = "WebserverApache"
  }
}

