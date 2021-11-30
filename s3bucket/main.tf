provider "aws" {
  region = "ap-south-1"
  profile = "jenkins"
}

resource "aws_s3_bucket" "test_bucket"{
  bucket = "terraform-test-buck-1234"
  acl = "private"
  tags = {
    name="terraform_test_buck_1234"
    purpose="test"
    environment = "test"
  }
  
}

resource "aws_s3_bucket_object" "myfirst_object"{
  bucket = "${aws_s3_bucket.id}"
  key = "testfile.txt"
  source = "testfile.txt"
  etag = "${md5(file("testfile.txt"))}"
}
