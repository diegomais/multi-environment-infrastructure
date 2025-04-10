variable "alb_sg_id" {
  description = "ALB Security Group (allowed in EC2 SG)."
  type        = string
}

variable "ami_id" {
  description = "Amazon Machine Image (AMI) to use for the EC2 instance."
  type        = string
}

variable "environment" {
  description = "Environment name (dev, staging, prod)."
  type        = string
}

variable "instance_type" {
  description = "Instance type to use for the EC2 instance."
  type        = string
}

variable "ssh_cidr_block" {
  description = "IP authorized to access EC2 via SSH. Example: YOUR_IP/32"
  type        = string
}

variable "subnet_id" {
  description = "VPC Subnet ID to launch in."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID."
  type        = string
}
