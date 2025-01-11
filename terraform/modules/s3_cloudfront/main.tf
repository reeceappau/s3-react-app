resource "aws_cloudfront_origin_access_control" "cloudfront_s3_oac" {
    name                              = "OAC for s3ra Bucket"
    description                       = "Origin Access Control for website bucket"
    origin_access_control_origin_type = "s3"
    signing_behavior                  = "always"
    signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "website_distribution" {
    enabled = true
    is_ipv6_enabled = true
    default_root_object = var.index_document
    
    origin {
        domain_name = var.bucket_regional_domain_name
        origin_id = "S3-${var.s3_bucket_id}"
        origin_access_control_id = aws_cloudfront_origin_access_control.cloudfront_s3_oac.id
    }

    default_cache_behavior {
        allowed_methods = ["GET", "HEAD"]
        cached_methods = ["GET", "HEAD"]
        # Using AWS Managed-CachingOptimized cache policy
        cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6"
        target_origin_id = "S3-${var.s3_bucket_id}"
        viewer_protocol_policy = "redirect-to-https"
    } 

    restrictions {
        geo_restriction {
            restriction_type = "none"
        }
    }

    viewer_certificate {
        cloudfront_default_certificate = true
    }
}

resource "aws_s3_bucket_policy" "cloudfront_oac_policy" {
  bucket = var.s3_bucket_id

  policy = jsonencode({
    Version = "2008-10-17"
    Id      = "PolicyForCloudFrontPrivateContent"
    Statement = [
      {
        Sid       = "AllowCloudFrontServicePrincipal"
        Effect    = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action   = "s3:GetObject"
        Resource = "arn:aws:s3:::${var.s3_bucket_id}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = aws_cloudfront_distribution.website_distribution.arn
          }
        }
      }
    ]
  })
}
