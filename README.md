# AWS Lambda CI/CD Demo
This repository demonstrates how to deploy an AWS Lambda function using **Terraform** and **GitHub Actions**. It is intended as a reference implementation for setting up secure, automated deployment pipelines in AWS.

## Purpose
This setup is used to test IAM roles, validate CI/CD security configurations, and ensure minimal permissions are sufficient for deployment and execution. It’s ideal for teams adopting Infrastructure as Code and GitHub-based automation.

## Services Used
- **AWS Lambda** – to host the serverless function
- **Terraform** – to define infrastructure as code
- **GitHub Actions** – to automate deployment

## Project Structure
aws-lambda-cicd-demo/
├── .github/workflows/deploy.yml # GitHub Actions deployment pipeline

├── lambda/hello_world.py # Python Lambda function

├── terraform/ # Terraform configuration

│ ├── main.tf # Lambda resource definitions

│ ├── variables.tf # Reusable variables (e.g. region, name)

│ ├── outputs.tf # Useful outputs like function name

│ └── provider.tf # AWS provider configuration

├── README.md # Project documentation

└── .gitignore # Ignore zip packages and Terraform state

## Steps Taken
1. Created a GitHub repository: `aws-lambda-cicd-demo`
2. Wrote a simple "Hello from Lambda!" function in Python
3. Wrote Terraform code to:
   - Package the Lambda function into a `.zip`
   - Define an `aws_lambda_function` resource using an **execution role**
   - Reference the IAM role pre-created for Lambda execution
4. Created a GitHub Actions workflow to:
   - Automatically deploy on pushes to `main`
   - Use OIDC to assume a **deployment role** with least-privilege AWS permissions
   - Run `terraform init`, `plan`, and `apply` on the Terraform code

## Roles Used
- **Deployment Role:** `HelloWorld_IAM_Role_WebID_CICD_GitHuActions`  
  GitHub Actions assumes this role via OIDC to deploy resources using Terraform.

- **Execution Role:** `HelloWorld_Iam_Role`  
  This is assumed by the Lambda function itself at runtime.

## Requirements
- AWS IAM roles must be preconfigured with appropriate trust policies and permissions.
- OIDC provider must be set up in the AWS account to enable GitHub Actions authentication.
