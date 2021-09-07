terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0443305dabd4be2bc"
  instance_type = "t2.micro"
  tags = {
    Name = "terraform_demo"
  }
}

resource "aws_security_group_rule" "allow_app" {
  type              = "ingress"
  from_port         = "8080"
  to_port           = "8080"
  protocol          = "tcp"
  security_group_id = "sg-b3299cf8"
  self              = "true" 
}

resource "aws_security_group_rule" "allowmysql" {
  type              = "ingress"
  from_port         = "3306"
  to_port           = "3306"
  protocol          = "tcp"
  security_group_id = "sg-b3299cf8"
  self              = "true" 
}
