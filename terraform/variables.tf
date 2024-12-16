variable "region" {
  default     = "us-east-1"
  description = "AWS region."
}

variable "bucket_name" {
  description = "S3 bucket name."
}

variable "bucket_tag_name" {
  description = "Tag name for the S3 bucket."
}

variable "deploy_env" {
  description = "Deployment environment."
}

variable "index_suffix" {
  default     = "index.html"
  description = "Index document."
}

variable "error_key" {
  default     = "index.html"
  description = "Error document key."
}

variable "block_acls" {
  default     = false
  description = "Block public ACLs."
}

variable "block_policy" {
  default     = false
  description = "Block public policies."
}

variable "ignore_acls" {
  default     = false
  description = "Ignore public ACLs."
}

variable "restrict_buckets" {
  default     = false
  description = "Restrict public buckets."
}

variable "function_name" {
  description = "Lambda function name."
}

variable "handler" {
  description = "Lambda function handler."
}

variable "runtime" {
  description = "Lambda runtime environment."
}

variable "package_path" {
  description = "Lambda package path."
}

variable "exec_role_name" {
  description = "IAM role name for Lambda."
}

variable "api_name" {
  description = "API Gateway name."
}

variable "api_description" {
  description = "API Gateway description."
}