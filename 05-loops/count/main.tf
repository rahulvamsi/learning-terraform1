resource "aws_instance" "web" {
  count         = 2
  ami           = "ami-07ef4d849950da0b3"
  instance_type = "t3.micro"
  tags = {
    Name = "sample-${count.index + 1}"
  }
}

