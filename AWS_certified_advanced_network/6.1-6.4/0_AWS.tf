#define terraform version
terraform {
  required_version = ">= 1.6" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    null = {
      source = "hashicorp/null"
      version = "~> 3.0"
    }        
  }
}

# Provider AWS
provider "aws" {
  #alias = "us-east-1"
  region  = var.us_region
  access_key = ""
  secret_key = ""
}

# Provider AWS
provider "aws" {
  alias = "sa-east-1"
  region  = var.sa_region
  access_key = ""
  secret_key = ""
}