data "aws_iam_role" "lambda_exec_role" {
  name = "HelloWorld_Iam_Role"
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/../lambda/hello_world.py"
  output_path = "${path.module}/hello_world.zip"
}

resource "aws_lambda_function" "hello_lambda" {
  function_name = var.function_name
  role          = data.aws_iam_role.lambda_exec_role.arn
  handler       = "hello_world.lambda_handler"
  runtime       = "python3.12"

  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
}
