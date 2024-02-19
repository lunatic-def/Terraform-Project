module "vpc1" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.1"

  #Asset VPC Details

  name = var.name[0]
  cidr = var.cidr[0]

  azs = var.azs
  #private_subnets = var.vpc1_private_subnets
  # Public subnet create default IGW
  public_subnets = var.vpc1_public_subnets

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

module "vpc2" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.1"

  #Asset VPC Details

  name = var.name[1]
  cidr = var.cidr[1]

  azs = var.azs
  #private_subnets = var.vpc1_private_subnets
  # Public subnet create default IGW
  public_subnets = var.vpc2_public_subnets

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

module "vpc3" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.1"

  #Asset VPC Details

  name = var.name[2]
  cidr = var.cidr[2]

  azs = var.azs
  #private_subnets = var.vpc1_private_subnets
  # Public subnet create default IGW
  public_subnets = var.vpc3_public_subnets

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