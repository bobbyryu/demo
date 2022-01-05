# S3 Bucket Public Access Block
resource "aws_s3_bucket" "ziyoprojectbucket2" {
  bucket = var.bucket_name2
}

resource "aws_s3_bucket_public_access_block" "ziyo-block" {
  bucket = aws_s3_bucket.ziyoprojectbucket2.id

  block_public_acls   = true
  block_public_policy = true
}