# creating main s3
resource "aws_s3_bucket" "main_bucket" {
  bucket = var.main_bucket_name
}

# creating artifacts s3
resource "aws_s3_bucket" "artifacts_bucket" {
  bucket = var.artifacts_bucket_name
}

