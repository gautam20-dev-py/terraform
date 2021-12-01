provider "aws" {
  region = "ap-south-1"
  profile = "jenkins"
}

variable "vpc_id"{
    type = string
    default = "vpc-08a44663"
}

resource "aws_security_group" "terraform_allowssh" {
    name = "terraform_allowssh"
    description = "Security Group to allow SSh Access"
    vpc_id = "${var.vpc_id}"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "test_instance" {
  ami = "ami-0108d6a82a783b352"
  instance_type = "t2.micro"
  subnet_id = "subnet-54562f18"
  associate_public_ip_address = "true"
  security_groups = ["${aws_security_group.terraform_allowssh.id}"]
  key_name = "ec2KP"
  tags  = {
    name = "Terraform Instance"
    created_by = "Terraform"
  }
  iam_instance_profile = "arn:aws:iam::116413399134:instance-profile/ec2-s3-role"
}