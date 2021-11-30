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