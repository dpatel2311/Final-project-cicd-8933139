region = "us-east-1"

bucket_name      = "8933139-static-website"
bucket_tag_name  = "Static Website Bucket"
deploy_env         = "Prod"

function_name = "8933139-lambda-function"
handler       = "handler.handler"
runtime       = "nodejs22.x"
package_path  = "../lambda/package.zip"
exec_role_name = "8933139-lambda_role"

api_name        = "jokesAPI"
api_description = "API for fetching text from Lambda"
