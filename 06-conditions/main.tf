resource "aws_instance" "web" {
  ami           = "ami-07ef4d849950da0b3"
  instance_type = var.instance_type == null ? "t3.micro" : var.instance_type
}

variable "instance_type" {
  default = null
}

