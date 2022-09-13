resource "aws_instance" "web" {
  for_each      = var.sample
  ami           = "ami-07ef4d849950da0b3"
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
