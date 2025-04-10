variable "azs" {
  description = "List of availability zones for the subnet."
  type        = list(string)
}

variable "environment" {
  description = "Environment name (dev, staging, prod)."
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of IPv4 CIDR block for the subnet."
  type        = list(string)
}

variable "vpc_cidr" {
  description = "The IPv4 CIDR block for the VPC."
  type        = string
}
