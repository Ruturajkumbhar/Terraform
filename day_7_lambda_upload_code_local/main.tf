
resource "aws_iam_role" "lambda_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = var.role_policy_version
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = var.iam_policy_arn
}

resource "aws_lambda_function" "my_lambda" {
  function_name = var.lambda_func_name
  role          =  aws_iam_role.lambda_role.arn
  handler       = var.lambda_handler
  runtime       = var.lambda_runtime
  timeout       = 900
  memory_size   = 128
  filename = "lambda_function.zip"

 
  source_code_hash = filebase64sha256("lambda_function.zip")

  #Without source_code_hash, Terraform might not detect when the code in the ZIP file has changed — meaning your Lambda might not update even after uploading a new ZIP.

#This hash is a checksum that triggers a deployment.
}