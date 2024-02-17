module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.1"

  #Asset VPC Details

  name = var.name
  cidr = var.cidr

  azs = var.azs
  private_subnets = var.vpc_private_subnets
  # Public subnet create default IGW
  public_subnets = var.vpc_public_subnets

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = {
    Type = "Public Subnets"
    }
  private_subnet_tags = {
    Type = "Private Subnets"
    } 
}