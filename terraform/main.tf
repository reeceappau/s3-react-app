terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

module "backend" {
  source        = "./modules/remote_backend"
  iam_user_name = var.iam_user_name
  bucket_name   = var.bucket_name
  table_name    = var.table_name
}

module "s3_website" {
  source             = "./modules/s3_website"
  website_bucket     = var.website_bucket
  false_destroy      = var.false_destroy
  versioning_enabled = var.versioning_enabled
  index_document     = var.index_document
  region             = var.region
}

module "cloudfront" {
  source                      = "./modules/s3_cloudfront"
  bucket_regional_domain_name = module.s3_website.bucket_regional_domain_name
  s3_bucket_id                = module.s3_website.s3_bucket_id
  index_document              = module.s3_website.index_document
}