resource "random_string" "random" {
  length = 6
  special = false
  upper = false
} 
locals {
  bucket_name = "s3-bucket-${random_string.random.result}"
}

locals {
  statement = {
    Version: "2012-10-17",
    Statement: [
      {
        Sid: "PublicReadGetObject",
        Effect: "Allow",
        Principal: "*",
        Action: [
          "s3:GetObject"
        ],
        Resource: [
         "arn:aws:s3:::${local.bucket_name}/*",
        ]
      }
    ]
  }
}
