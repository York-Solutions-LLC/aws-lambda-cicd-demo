# Output
# Specifies outputs from the Terraform deployment (e.g., Lambda function name) for visibility or chaining.

# Output the name of the created Lambda function after deployment
output "lambda_function_name" {
  value = aws_lambda_function.hello_lambda.function_name  # Refers to the Lambda function defined in main.tf
}
