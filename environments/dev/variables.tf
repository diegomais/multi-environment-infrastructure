variable "ami_id" {
  description = "Amazon Machine Image (AMI) to use for the EC2 instance."
  type        = string
}

variable "azs" {
  description = "List of availability zones for the subnet."
  type        = list(string)
}

variable "environment" {
  description = "Environment name (dev, staging, prod)."
  type        = string
}

variable "instance_type" {
  description = "Instance type to use for the EC2 instance."
  type        = string
}

variable "aws_region" {
  description = "AWS Region where the provider will operate."
  type        = string
}

variable "ssh_cidr_block" {
  description = "IP authorized to access EC2 via SSH. Example: YOUR_IP/32"
  type        = string
}

variable "vpc_cidr" {
  description = "The IPv4 CIDR block for the VPC."
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of public subnet IDs to attach to ALB."
  type        = list(string)
}


