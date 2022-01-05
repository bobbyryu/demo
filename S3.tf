#S3 bucket
resource "aws_s3_bucket" "ziyoprojectbucket1" {
  bucket = "cloudavengerszt1111111"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
  versioning {
    enabled = true
  }
}