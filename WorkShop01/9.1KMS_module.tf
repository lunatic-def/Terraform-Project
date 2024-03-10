module "kms" {
  source  = "terraform-aws-modules/kms/aws"
  version = "2.2.1"
  aliases = [ "rds_kms" ]

  deletion_window_in_days = 7 # for testing
  description             = "Complete key example showing various configurations available"
  enable_key_rotation     = false # for testing 
  is_enabled              = true
  key_usage               = "ENCRYPT_DECRYPT"
  multi_region            = false
  policy      = data.aws_iam_policy_document.rds_key.json 
  tags = {
    Name  = "rds_kms"
  }

}