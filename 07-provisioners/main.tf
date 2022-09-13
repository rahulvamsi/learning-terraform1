//resource "aws_instance" "web" {
//  ami                    = "ami-05403c07e1c840e24"
//  instance_type          = "t3.micro"
//  vpc_security_group_ids = ["sg-02afc752c16b2fa2e"]
//
//  provisioner "remote-exec" {
//
//    connection {
//      host     = self.public_ip
//      user     = "root"
//      password = "DevOps321"
//    }
//
//    inline = [
//      "echo Hello World"
//    ]
//
//  }
//}

resource "aws_instance" "web" {
  ami                    = "ami-05403c07e1c840e24"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-02afc752c16b2fa2e"]
}

resource "null_resource" "cli" {
  triggers = {
    abc = timestamp()
  }
  provisioner "remote-exec" {

    connection {
      host     = aws_instance.web.public_ip
      user     = "root"
      password = "DevOps321"
    }

    inline = [
      "echo Hello Galaxy"
    ]

  }
}
