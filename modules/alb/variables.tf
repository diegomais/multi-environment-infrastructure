variable "environment" {
  description = "Environment name (dev, staging, prod)."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID."
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs to attach to ALB."
  type        = list(string)
}

variable "instance_id" {
  description = "EC2 instance ID to attach to ALB."
  type        = string
}
