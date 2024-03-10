module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.1"

  #Asset VPC Details

  name = var.name
  cidr = var.cidr

  azs = var.azs
  private_subnets = var.vpc_private_subnets
  public_subnets = var.vpc_public_subnets
  database_subnets = var.vpc_database_subnets

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true
  # NAT gateway
  enable_nat_gateway = true

  public_subnet_tags = {
    Type = "Public Subnets"
  }
  private_subnet_tags = {
    Type = "Private Subnets"
  } 

  database_subnet_tags = {
    Type = "Private Database Subnets"
  }
}