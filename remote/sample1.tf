resource "aws_instance" "sample" {

  ami           = "ami-05403c07e1c840e24"
  instance_type = "t2.micro"
}