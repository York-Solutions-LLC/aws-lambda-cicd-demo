# Variables
# Declares input variables used across Terraform files to allow for configuration and reuse.

# Define a variable for the AWS region to be used by the provider block
variable "aws_region" {
  default = "us-east-2"  # Set the default AWS region to US East (Ohio)
}

# Define a variable for the Lambda function name
variable "function_name" {
  default = "hello_lambda"  # Name that will be given to the Lambda function
}
