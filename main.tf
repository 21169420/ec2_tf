provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web" {
  ami           = "ami-02eb7a4783e7e9317"
  instance_type = "t2.micro"
  #key_name      = "my-keypair"
  
  vpc_security_group_ids = [
    aws_security_group.web_sg.id
  ]

  tags = {
    Name = "web-server"
  }
}

resource "aws_security_group" "web_sg" {
  name_prefix = "web_sg_"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}
