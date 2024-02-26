module "us" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.1"

  #Asset VPC Details

  name = var.name[0]
  cidr = var.cidr[0]

  azs = var.us_azs #us-1a
  #private_subnets = var.vpc_private_subnets
  # Public subnet create default IGW
  public_subnets = var.us_public_subnets

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = {
    Type = "us_public_subnet"
  }

  # providers = {
  #   aws = aws.us-east-1
  # }
}

module "sa" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.1"

  #Asset VPC Details

  name = var.name[1]
  cidr = var.cidr[1]

  azs = var.sa_azs #sa-1a
  #private_subnets = var.vpc_private_subnets
  # Public subnet create default IGW
  public_subnets = var.sa_public_subnets

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = {
    Type = "sa_public_subnet"
  }

  providers = {
    aws = aws.sa-east-1
  }
}
