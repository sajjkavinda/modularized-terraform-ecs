output "main_bucket_name" {
  value = aws_s3_bucket.main_bucket
}
output "main_bucket_arn" {
  value = aws_s3_bucket.main_bucket.arn
}

output "artifacts_bucket_name" {
  value = aws_s3_bucket.artifacts_bucket.id
}