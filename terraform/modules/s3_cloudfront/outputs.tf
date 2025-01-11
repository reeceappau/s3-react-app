output "cloudfront_distribution_id" {
  description = "The id of the cloudfront distribution"
  value = aws_cloudfront_distribution.website_distribution.id
}

output "cloudfront_distribution_domain_name" {
  value = "http://${aws_cloudfront_distribution.website_distribution.domain_name}"
  description = "The domain name of the CloudFront distribution"
}