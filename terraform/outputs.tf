output "iam_user_name" {
  description = "The IAM user for the terraform"
  value       = module.backend.iam_user_arn
}

output "s3_bucket_id" {
  description = "The ID of the S3 Bucket"
  value       = module.s3_website.s3_bucket_id
}

output "s3_bucket_arn" {
  description = "The ARN of the S3 Bucket"
  value       = module.s3_website.s3_bucket_arn
}

output "website_url" {
  description = "The URL of the website"
  value       = module.s3_website.website_url
}

output "cloudfront_distribution_id" {
  description = "The ID of the cloudfront distrbution"
  value       = module.cloudfront.cloudfront_distribution_id
}

output "cloudfront_distribution_domain_name" {
  description = "The domain name of the CloudFront distribution"
  value       = module.cloudfront.cloudfront_distribution_domain_name
}