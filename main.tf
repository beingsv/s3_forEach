resource "aws_s3_bucket" "practice-s3" {
  for_each = var.bucket-name
  bucket = each.value
  tags = var.shiwam-tags

}

resource "aws_s3_bucket_acl" "practice-s3" {
  for_each = aws_s3_bucket.practice-s3
  depends_on = [aws_s3_bucket.practice-s3]

  bucket = aws_s3_bucket.practice-s3[each.key].id
  acl    = var.acl
}