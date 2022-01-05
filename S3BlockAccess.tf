# S3 Bucket Public Access Block
resource "aws_s3_bucket" "cloud-avengers-bucket" {
  bucket = "cloud-avengers-bucket"
}

resource "aws_s3_bucket_public_access_block" "cloud-avengers-bucket" {
  bucket = aws_s3_bucket.cloud-avengers-bucket.id

  block_public_acls   = true
  block_public_policy = true
}