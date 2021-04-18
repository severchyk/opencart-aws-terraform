module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "1.22.0"
  bucket  = "sev-terraform-state"
  acl     = "private"

  object_lock_configuration = {
    object_lock_enabled = "Enabled"
    rule = {
      default_retention = {
        mode = "GOVERNANCE"
        days = 1
      }
    }
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning = {
    enabled = "true"
  }

  create_bucket = true
  force_destroy = true

  # S3 bucket-level Public Access Block configuration
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
