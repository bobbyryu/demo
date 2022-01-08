#S3 bucket
resource "aws_s3_bucket" "ziyoprojectbucket1" {
  bucket = "cloudavengererfsdfsdfgnnbfr"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
  versioning {
    enabled = true
  }
}