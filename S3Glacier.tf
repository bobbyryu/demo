resource "aws_s3_bucket" "ziyoprojectbucket3" {
  bucket = var.bucket_name3
  acl    = "private"

  lifecycle_rule {
    id      = "log"
    enabled = true

    prefix = "log/"

    tags = {
      rule      = "log"
      autoclean = "true"
    }

    #transition {
     # days          = 90
      #storage_class = "STANDARD_IA" # or "ONEZONE_IA"
    #}

    transition {
      days          = 90
      storage_class = "GLACIER"
    }

    expiration {
      days = 1825
    }
  }

  lifecycle_rule {
    id      = "tmp"
    prefix  = "tmp/"
    enabled = true

    expiration {
      date = "2027-02-01"
    }
  }
}

resource "aws_s3_bucket" "ziyoprojectbucket24" {
  bucket = var.bucket_name
  acl    = "private"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    prefix  = "config/"
    enabled = true

    #noncurrent_version_transition {
     # days          = 90
      #storage_class = "STANDARD_IA"
    #}

    noncurrent_version_transition {
      days          = 90
      storage_class = "GLACIER"
    }

    noncurrent_version_expiration {
      days = 1825
    }
  }
}