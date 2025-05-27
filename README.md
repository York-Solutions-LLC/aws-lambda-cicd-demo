# AWS Lambda CI/CD Demo
This repo deploys a simple "Hello from Lambda!" function using Terraform and GitHub Actions. It is designed for security testing and DevOps pipeline validation.

## Services Used
- AWS Lambda
- GitHub Actions
- Terraform

### Steps Taken
- Created a new GitHub repository: aws-lambda-cicd-demo
- Wrote a simple Lambda function in Python
- Wrote Terraform code to:
    - Package the Lambda code
    - Create a Lambda function in AWS
    - Create and attach an IAM role for Lambda execution
- Created a GitHub Actions workflow to deploy the infrastructure automatically on pushes to main
- Added the following secrets to the github repo:
    - AWS_ACCESS_KEY_ID
    - AWS_SECRET_ACCESS_KEY

