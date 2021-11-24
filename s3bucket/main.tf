provider "aws" {
  region = "ap-south-1"
  profile = "jenkins"
}

resource "aws_s3_bucket" "terraform_test_buck_1234"{

}
