resource "aws_instance" "web" {
  ami                    = "ami-05403c07e1c840e24"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.web.id]
}

