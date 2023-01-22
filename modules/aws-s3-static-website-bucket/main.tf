resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
  acl    = "public-read"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Sid": "PublicReadGetObject",
          "Effect": "Allow",
          "Principal": "*",
          "Action": [
              "s3:GetObject"
          ],
          "Resource": [
              "arn:aws:s3:::${var.bucket_name}/*"
          ]
      }
  ]
}  
EOF
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
  tags          = var.tags
  force_destroy = true
}
resource "aws_s3_bucket_object" "index"{
    bucket       = "${aws_s3_bucket.s3_bucket.bucket}"
    key          = "index.html"
    source       = "index.html"
    content_type = "text/html"
    etag         = "${md5(file("index.html"))}"
    acl          = "public-read"
}

resource "aws_s3_bucket_object" "error"{
    bucket       = "${aws_s3_bucket.s3_bucket.bucket}"
    key          = "error.html"
    source       = "error.html"
    content_type = "text/html"
    etag         = "${md5(file("error.html"))}"
    acl          = "public-read"
}
