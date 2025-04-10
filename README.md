# Multi-Environment AWS Infrastructure with Terraform

## :computer: Overview

This project demonstrates how to configure and manage a distributed infrastructure across multiple environments (production, staging, and development) on AWS using Terraform. It emphasizes code reuse through modules, environment-specific configurations, and secure variable management.

## :rocket: Architecture

The target architecture consists of the following AWS resources (managed by Terraform):

1.  **VPC:** A dedicated Virtual Private Cloud to provide network isolation.
2.  **EC2 Instances:** Virtual machines to run the application. Instance types and counts can vary per environment.
3.  **Load Balancer (Optional):** An Application Load Balancer (ALB) added to distribute traffic across EC2 instances, especially for production and staging environments.
4.  **Security Groups:** Firewall rules to control inbound and outbound traffic to EC2 instances and potentially other resources. **ALB SG**: accepts HTTP/HTTPS traffic from the world. **EC2 SG**: accepts only traffic coming from the ALB (by `security_group_id`).

## :building_construction: Project Structure

```
terraform-infra/
├── environments/
│   ├── dev/
│   │   ├── main.tf # Environment-specific configuration
│   │   ├── terraform.tfvars # Environment-specific variables
│   │   └── variables.tf # Environment-specific variables
│   ├── staging/
│   │   └── ...
│   └── prod/
│       └── ...
├── modules/
│   └── alb/
│   │   ├── main.tf # Module-specific configuration
│   │   ├── outputs.tf # Module-specific outputs
│   │   └── variables.tf # Module-specific variables
│   ├── ec2/
│   │   └── ...
│   ├── vpc/
│       └── ...
├── providers.tf # Terraform required providers
└── README.md
```

*   **`environments/`**: Contains separate directories for each deployment environment (`dev`, `staging`, `prod`). Each environment directory is a self-contained Terraform root module.
*   **`modules/`**: Contains reusable Terraform modules (e.g., `ec2`) used by the environment configurations to promote DRY (Don't Repeat Yourself) principles.

## :seat: Prerequisites

1.  **Terraform:** Install Terraform CLI (Download Terraform).
2.  **AWS Account:** An active AWS account.
3.  **AWS Credentials:** Configure AWS credentials for Terraform. Common methods include:
    *   Setting `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, and optionally `AWS_SESSION_TOKEN` environment variables.
    *   Using an AWS credentials file (`~/.aws/credentials`).
    *   Using an IAM role attached to an EC2 instance or ECS task (recommended for CI/CD or AWS-based execution).
    *   Using AWS SSO (as potentially indicated by the context). Ensure your profile is configured correctly.

## :sparkles: Deployment Instructions

To deploy or manage a specific environment:

1.  **Navigate to the environment directory:**
    ```bash
    cd environments/<environment_name>
    # Example: cd environments/dev
    ```

2.  **Initialize Terraform:**
    Download required providers and modules.
    ```bash
    terraform init
    ```

3.  **Review the Plan:**
    Check what resources Terraform will create, modify, or destroy. Use a `.tfvars` file for environment-specific values.
    ```bash
    # Option 1: Using a terraform.tfvars file in the directory
    terraform plan

    # Option 2: Specifying a variable file
    # terraform plan -var-file="terraform.tfvars"
    ```

4.  **Apply the Configuration:**
    Provision the infrastructure on AWS.
    ```bash
    # Option 1: Using a terraform.tfvars file in the directory
    terraform apply

    # Option 2: Specifying a variable file
    # terraform apply -var-file="terraform.tfvars"

    # Auto-approve (use with caution, typically in automation)
    # terraform apply -auto-approve
    ```

## :see_no_evil: Variable Management

*   **Module Variables (`modules/*/variables.tf`):** Define input variables required by each reusable module.
*   **Environment Variables (`environments/*/variables.tf`):** Define input variables specific to each environment's root configuration.
*   **Variable Definitions (`environments/*/terraform.tfvars`):** Assign values to the variables defined in `variables.tf` for each specific environment.

## :cop: Security Considerations

*   **Least Privilege:** Ensure IAM roles and users used by Terraform have only the necessary permissions.
*   **Security Groups:** Define strict security group rules to allow only required traffic.
*   **Secrets Management:** Avoid hardcoding secrets. Use environment variables, AWS Secrets Manager, or other secure methods.
*   **State File Security:** Terraform state files can contain sensitive data. Store them securely, often using a Terraform backend like AWS S3 with encryption and access controls.

## :fire: Destroying Infrastructure

To remove all resources managed by Terraform in a specific environment:

1.  **Navigate to the environment directory:**
    ```bash
    cd environments/<environment_name>
    ```

2.  **Destroy Resources:**
    ```bash
    terraform destroy
    # Or specify the var file if needed
    # terraform destroy -var-file="terraform.tfvars"
    ```

    Confirm the action by typing `yes` when prompted.

## :thinking: How to contribute

- Fork this repository;
- Create a branch with your feature: `git checkout -b my-feature`;
- Commit your changes: `git commit -m '[feat](scope): my new feature'`;
- Push to your branch: `git push origin my-feature`.

After the merge of your pull request is done, you can delete your branch.

## :memo: License

This project is under the MIT license. See the [LICENSE](LICENSE) for more details.

---

Made with :heart: by [Diego Mais](https://diegomais.github.io) :wave:.
