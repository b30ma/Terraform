locals {
  aws_region = <" ">
  aws_access_key = "YOUR_AWS_ACCESS_KEY"
  aws_secret_key = "YOUR_AWS_SECRET_KEY"
  bucket_name = "< >-bucket"
  variable "aws_region" {
    description = "AWS region where the S3 bucket will be created."
    type        = string
  }

variable "aws_access_key" {
  description = "AWS access key for the new AWS account."
  type        = string
  }

variable "aws_secret_key" {
  description = "AWS secret key for the new AWS account."
  type        = string
  }

variable "bucket_name" {
  description = "Name for the S3 bucket."
  type        = string
  }
}

provider "aws" {
  region = local.var.aws_region
  access_key = local.var.aws_access_key
  secret_key = local.var.aws_secret_key
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = local.var.bucket_name
  acl    = "private"
}


output "bucket_id" {
  description = "The ID of the S3 bucket."
  value       = aws_s3_bucket.< >_bucket.id
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket."
  value       = aws_s3_bucket.< >_bucket.arn
}
