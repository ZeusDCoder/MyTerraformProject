# variables.tf

variable "bucket_prefix" {
  description = "A unique prefix for your S3 bucket name."
  type        = string
  default     = "my-tf-bucket" # A default value if none is provided
}

variable "aws_region" {
  description = "The AWS region where resources will be deployed."
  type        = string
  default     = "us-west-2" # Set your preferred default region
}

variable "environment_tag" {
  description = "The environment tag for resources."
  type        = string
  default     = "Dev"
}

variable "common_tags" {
  description = "A map of common tags to apply to all resources."
  type        = map(string)
  default = {
    ManagedBy = "Terraform"
    Project   = "MyFirstTFProject"
  }
}