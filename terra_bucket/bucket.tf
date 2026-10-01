provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_s3_bucket" "s3b1" {
  bucket = "backup.terraform.statefile.bucket"
}

resource "aws_s3_bucket_versioning" "ver1" {
  bucket = aws_s3_bucket.s3b1.id

  versioning_configuration {
    status = "Enabled"
  }
}
