module "Provider" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.1"

  #Asset VPC Details

  name = var.name[0]
  cidr = var.cidr[0]

  azs = var.azs #us-1a
  #private_subnets = var.vpc_private_subnets
  # Public subnet create default IGW
  public_subnets = var.provider_public_subnets

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = {
    Type = "Public Subnets"
    }
}


module "Consumer" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.1"

  #Asset VPC Details

  name = var.name[1]
  cidr = var.cidr[1]

  azs = var.azs # us-1b
  #private_subnets = var.vpc_private_subnets
  # Public subnet create default IGW
  public_subnets = var.consumer_public_subnets

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = {
    Type = "Public Subnets"
    }
  # private_subnet_tags = {
  #   Type = "Private Subnets"
  #   } 
}