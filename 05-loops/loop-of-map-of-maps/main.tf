resource "aws_instance" "web" {
  for_each      = var.sample
  ami           = "ami-05403c07e1c840e24"
  instance_type = each.value["type"]
  tags = {
    Name = each.value["name"]
  }
}

variable "sample" {
  default = {
    one = {
      type = "t3.micro"
      name = "one"
    }
    two = {
      type = "t3.medium"
      name = "two"
    }
  }
}
