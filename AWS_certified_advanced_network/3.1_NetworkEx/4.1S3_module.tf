##### PUBLIC STATIC WEBSITE USING S3  #####

module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.1.0"

  bucket = local.bucket_name

  force_destroy       = true
#   acceleration_status = "Suspended"
#   request_payer       = "BucketOwner"

  tags = {
    Owner = "Anh"
    name = "S3 bucket test"
  }
  # Note: Object Lock configuration can be enabled only on new buckets
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object_lock_configuration
  
  object_lock_enabled = false # for testing purpose
# web site 
 website = {

    index_document = "index.html"
    error_document = "error.html"
  }
# S3 bucket-level Public Access Block configuration (by default now AWS has made this default as true for S3 bucket-level block public access)
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false

  attach_policy                            = true
  policy                                   =  jsonencode(local.statement)

}
##### will upload all the files present under HTML folder to the S3 bucket #####
resource "aws_s3_object" "upload_object" {
  for_each      = fileset("html/", "*")
  bucket        = module.s3_bucket.s3_bucket_id
  key           = each.value
  source        = "html/${each.value}"
  etag          = filemd5("html/${each.value}")
  content_type  = "text/html"
}

