terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "my_first_bucket" {
  bucket = "test-bucket-us-west-2-12345" # S3 bucket names must be globally unique
  arn = "arn:aws:s3:::test-bucket-us-west-2-12345" # Example ARN, replace with your bucket name
}

output "bucket_name" {
  description = "The name of the created S3 bucket"
  value       = aws_s3_bucket.my_first_bucket.bucket
}

output "bucket_arn" {
  description = "The ARN of the created S3 bucket"
  value       = aws_s3_bucket.my_first_bucket.arn
}

resource "aws_s3_bucket_public_access_block" "my_first_bucket_pab" {
  bucket = aws_s3_bucket.my_first_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}