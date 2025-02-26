terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_s3_bucket" "s3_bucket_Create"{
    bucket = "checkif-possible"
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.s3_bucket_Create.id
  key    = "create-buckets"
  source = "/Users/yugpatel/Documents/Study/aws-cmd/aws_bash-scripting/s3/create-buckets"
  acl = "private"
  etag = filemd5("/Users/yugpatel/Documents/Study/aws-cmd/aws_bash-scripting/s3/create-buckets")
}



