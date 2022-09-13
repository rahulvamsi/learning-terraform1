resource "aws_instance" "web" {
  count         = 2
  ami           = "ami-05403c07e1c840e24"
  instance_type = "t3.micro"
  tags = {
    Name = "sample-${count.index + 1}"
  }
}

