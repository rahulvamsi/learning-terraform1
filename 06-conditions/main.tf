resource "aws_instance" "web" {
  ami           = "ami-05403c07e1c840e24"
  instance_type = var.instance_type == null ? "t3.micro" : var.instance_type
}

variable "instance_type" {
  default = null
}

