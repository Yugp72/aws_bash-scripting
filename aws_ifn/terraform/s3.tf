resource "aws_s3_bucket" "my-s3-bucket" {
  bucket = "my-tf-test-bucket-terroaform"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}