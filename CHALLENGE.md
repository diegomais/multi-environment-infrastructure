# Challenge: **Multi-Environment Infrastructure Configuration**

## Introduction

This challenge aims to consolidate the knowledge acquired during the module. You will configure a distributed infrastructure in three environments (prod, staging, and dev) using Terraform. Each environment requires specific configurations, such as different instance sizes, environment variables, and network settings.

## Tasks

1. Architecture Definition
- Design a basic architecture for the application that includes EC2 instances, a VPC, and a load balancer.
2. Environment Configuration
- Create separate configurations for each environment (prod, staging, and dev) using Terraform modules to ensure code reuse.
- Each environment should have unique configurations, such as EC2 instance sizes, environment variables, and specific security rules.
3. Variable Management
- Use Terraform variables to manage the specific details of each environment, such as access keys, passwords, and resource IDs.
- Keep sensitive credentials out of Terraform code by using resources such as AWS Secrets Manager or environment variables.
4. Security
- Implement good security practices, such as limiting access to resources, encrypting sensitive data, and enforcing resource access control policies.
5. Documentation
- Clearly document the infrastructure structure in a README.md file, including the purpose of each resource, dependencies between them, and instructions for deploying and managing the infrastructure.

## Expected Results

- Organization and modularity of Terraform code.
- Efficient use of variables and modules to avoid code repetition.
- Adherence to good security and secrets management practices.
- Clear and comprehensive infrastructure documentation.