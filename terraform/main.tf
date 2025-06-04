# Main
# Defines the core AWS infrastructure resources (e.g., Lambda function) for this project.

# Reference an existing IAM role (used by the Lambda function at runtime)
data "aws_iam_role" "lambda_exec_role" {
  name = "HelloWorld_Iam_Role"             # The name of the existing execution role in AWS
}

# Create a ZIP archive of the Lambda function code so it can be uploaded
data "archive_file" "lambda_zip" {
  type        = "zip"                                      # Archive type
  source_file = "${path.module}/../lambda/hello_world.py"  # Path to the source Python file
  output_path = "${path.module}/hello_world.zip"           # Output path for the generated zip
}

# Define the AWS Lambda function resource
resource "aws_lambda_function" "hello_lambda" {
  function_name = var.function_name                       # Name of the Lambda function (from variables.tf)
  role          = data.aws_iam_role.lambda_exec_role.arn  # Attach the execution role's ARN
  handler       = "hello_world.lambda_handler"            # Entry point: filename.function_name
  runtime       = "python3.12"                            # Python runtime environment

  filename         = data.archive_file.lambda_zip.output_path          # Path to ZIP file containing code
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256  # Used to detect code changes
}
