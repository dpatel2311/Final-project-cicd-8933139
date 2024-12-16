resource "aws_lambda_function" "text_function" {
  function_name = var.function_name
  handler       = var.handler
  runtime       = var.runtime
  role          = aws_iam_role.lambda_exec.arn
  filename      = var.package_path

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
        Action = "sts:AssumeRole"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Effect = "Allow"
        Sid    = ""
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