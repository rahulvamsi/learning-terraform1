//resource "aws_instance" "web" {
//  for_each      = toset(var.sample)
//  ami           = "ami-07ef4d849950da0b3"
//  instance_type = "t3.micro"
//  tags = {
//    Name = each.key
//  }
//}
//
//variable "sample" {
//  default = ["one", "two"]
//}
//

resource "aws_instance" "web" {
  for_each      = var.sample
  ami           = "ami-07ef4d849950da0b3"
  instance_type = each.value
  tags = {
    Name = each.key
  }
}

variable "sample" {
  default = {
    one = "t3.micro"
    two = "t3.medium"
  }
}



