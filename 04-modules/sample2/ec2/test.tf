resource "aws_instance" "web" {
  ami                    = "ami-07ef4d849950da0b3"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [var.sgid]
}

variable "sgid" {}
