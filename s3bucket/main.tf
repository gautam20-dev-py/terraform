provider "aws" {
  region = "ap-south-1"
  profile = "jenkins"
}

resource "aws_s3_bucket" "test_bucket"{
  name = "terraform_test_buck_1234"
  acl = "private"
  tags = {
    name="terraform_test_buck_1234"
    purpose="test"
    environment = "test"
  }
  
}
