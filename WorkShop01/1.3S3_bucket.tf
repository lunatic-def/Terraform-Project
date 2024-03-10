# Create S3 Bucket
resource "random_string" "random" {
  length = 6
  special = false
  upper = false
} 
locals {
  #bucket_name = "main-bucket-${random_string.random.result}"
  bucket_name = "main-bucket-hcicod"
  username = "cloudwatch_user"
}
# 1) use for cloudwatch_user -> cloudwatch,s3
locals {
  statement = {
    Version: "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowAllActions",
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::${local.bucket_name}",
                "arn:aws:s3:::${local.bucket_name}/*"
            ],
            "Principal": {
                "AWS": "arn:aws:iam::339712838104:user/${local.username}"
            }
        }
    ]
  }
}
module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.1.0"
  bucket = local.bucket_name
  force_destroy = true
  object_lock_enabled = false # for testing purpose
  # S3 bucket-level Public Access Block configuration (by default now AWS has made this default as true for S3 bucket-level block public access)
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  attach_policy = true
  policy =  jsonencode(local.statement)

  tags = {
    Name        = "My bucket"
  }
}