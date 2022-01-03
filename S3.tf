#S3 bucket
resource "aws_s3_bucket" "b" {
    bucket = "cloud-avengers-bucket"
    acl = "private"

    tags = {
      Name = "My bucket"
      Environment = "Dev"
    }
    versioning {
      enabled = true
    }
}