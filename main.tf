
provider "aws" {
 region= "ap-south-1"
 access_key     = "AKIA6HZPVPGXWQCSAD4Z"
 secret_key     = "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"
}

resource "aws_instance" "web" {
  ami= "ami-02eb7a4783e7e9317"
  instance_type = "t2.micro"

  tags = {
    name = "web-server"
  }
}

~
