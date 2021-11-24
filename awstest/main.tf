provider "aws" {
  region = "ap-south-1"
  profile = "jenkins"
}

resource "aws_instance" "test_instance" {
  ami = "amiid-ami-0108d6a82a783b352"
  instance_type = "t2.micro"
  subnet_id = "subnet-54562f18"
  associate_public_ip_address = "true"
  security_groups = ["${aws_security_group.testinstance_sg.name}"]
  key_name = "ec2KP"
}

resource "aws_security_group" "testinstance_sg" {
name = "testinstance_sg"
ingress{
  description = "ssh"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

}
