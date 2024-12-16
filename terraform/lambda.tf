resource "aws_lambda_function" "text_function" {
  function_name = var.function_name
  runtime       = var.runtime
  handler       = var.handler
  filename      = var.package_path
  role          = aws_iam_role.lambda_exec.arn

  environment {
    variables = {
      S3_BUCKET = aws_s3_bucket.static_website.bucket
    }
  }
}

resource "aws_iam_role" "lambda_exec" {
  name = var.exec_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Action    = "sts:AssumeRole"
        Sid       = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_lambda_permission" "allow_api_gateway" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.text_function.function_name
  principal     = "apigateway.amazonaws.com"
}