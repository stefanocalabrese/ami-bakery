resource "aws_s3_bucket" "bakery_store" {
  bucket = "bakery-store"

  # Force destroy deletes the bucket even if it contains objects (use with caution)
  force_destroy = false

  tags = {
    Name        = "bakery-store"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_versioning" "bakery_store_versioning" {
  bucket = aws_s3_bucket.bakery_store.id

  versioning_configuration {
    status = "Enabled" # Just in case..
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bakery_store_sse" {
  bucket = aws_s3_bucket.bakery_store.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256" # Default SSE encryption, you can change to KMS CMK if you intend to create one
    }
  }
}