variable "env" {
  description = "Depolyment environment"
  default     = "dev"
}

variable "region" {
  description = "AWS region"
  default     = "ap-south-1"
}

variable "repository_branch" {
  description = "Repository branch to connect to"
  default     = "master"
}

variable "repository_owner" {
  description = "GitHub repository owner"
  default     = "shahedex"
}

variable "repository_name" {
  description = "GitHub repository name"
  default     = "React-TodoList-App"
}

variable "static_web_bucket_name" {
  description = "S3 Bucket to deploy to"
  default     = "static-web-example-bucket-778877"
}

variable "artifacts_bucket_name" {
  description = "S3 Bucket for storing artifacts"
  default     = "static-web-example-artifacts-777788"
}

variable "github_token" {
}

output "web_public_url" {
  value = aws_s3_bucket.static_web_bucket.website_endpoint
}

output "cloudfront_public_url" {
  value = aws_cloudfront_distribution.codepipeline[0].domain_name
}
