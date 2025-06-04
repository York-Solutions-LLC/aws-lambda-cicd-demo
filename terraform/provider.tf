# Provider
# Configures the cloud provider (AWS) that Terraform will use to provision resources.

# Specify the AWS provider and set the region dynamically using a variable
provider "aws" {
  region = var.aws_region  # Uses the value defined in variables.tf to set the AWS region
}
