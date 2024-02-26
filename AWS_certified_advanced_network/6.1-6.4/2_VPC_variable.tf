#VPC ======================================================================
variable "create_vpc" {
  description = "Controls if VPC should be created (it affects almost all resources)"
  type        = bool
  default     = true
}

variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = list(string)
  default     = ["US-East", "Sao-Paulo"]
}
#CIDR block
variable "cidr" {
  description = "(Optional) The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using `ipv4_netmask_length` & `ipv4_ipam_pool_id`"
  type        = list(string)
  default     = ["10.1.0.0/16", "10.2.0.0/16"]
}
# availability zones
variable "us_azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = ["us-east-1a"]
}
variable "sa_azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = ["sa-east-1a"]
}

# VPC Public Subnets
variable "us_public_subnets" {
  description = "VPC Public Subnets"
  type = list(string)
  default = ["10.1.101.0/24"]
}
variable "sa_public_subnets" {
  description = "VPC Public Subnets"
  type = list(string)
  default = ["10.2.101.0/24"]
}


# # VPC Private Subnets
# variable "vpc_private_subnets" {
#   description = "VPC Private Subnets"
#   type = list(string)
#   default = ["10.0.1.0/24","10.0.2.0/24"]
# }
