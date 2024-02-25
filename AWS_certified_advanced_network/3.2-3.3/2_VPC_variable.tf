#VPC ======================================================================
variable "create_vpc" {
  description = "Controls if VPC should be created (it affects almost all resources)"
  type        = bool
  default     = true
}

variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = list(string)
  default     = ["Provider", "Consumer"]
}
#CIDR block
variable "cidr" {
  description = "(Optional) The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using `ipv4_netmask_length` & `ipv4_ipam_pool_id`"
  type        = list(string)
  default     = ["10.2.0.0/16", "10.0.0.0/16"]
}
# availability zones
variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = ["us-east-1a"]
}

# VPC Public Subnets
variable "provider_public_subnets" {
  description = "VPC Public Subnets"
  type = list(string)
  default = ["10.2.101.0/24"]
}

variable "consumer_public_subnets" {
  description = "Consumer Public Subnets"
  type = list(string)
  default = ["10.0.101.0/24"]
}


# # VPC Private Subnets
# variable "vpc_private_subnets" {
#   description = "VPC Private Subnets"
#   type = list(string)
#   default = ["10.0.1.0/24","10.0.2.0/24"]
# }
