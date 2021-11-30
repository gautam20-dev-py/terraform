provider "aws" {
  region = "ap-south-1"
  profile = "jenkins"
}

variable "vpc_id"{
    type = string
    default = "vpc-f722e09c"
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
  subnet_id = "subnet-04035b48"
  associate_public_ip_address = "true"
  security_groups = ["${aws_security_group.terraform_allowssh.name}"]
  key_name = "ec2KP"
}