resource "aws_instance" "app" {
  count                  = length(var.components)
  ami                    = data.aws_ami.ami.image_id
  instance_type          = "t3.micro"
  iam_instance_profile   = "SecretManager_Role_for_RoboShop_Nodes"
  vpc_security_group_ids = ["sg-02afc752c16b2fa2e"]
  tags = {
    Name = "${var.components["${count.index}"]}-dev"
  }
}

resource "aws_route53_record" "record" {
  count   = length(var.components)
  zone_id = "Z05563911B5TPM0CPTZND"
  name    = "${var.components["${count.index}"]}-dev"
  type    = "A"
  ttl     = 30
  records = [aws_instance.app.*.private_ip[count.index]]
}

resource "null_resource" "ansible-apply" {
  depends_on = [aws_route53_record.record]
  triggers = {
    abc = timestamp()
  }
  count = length(var.components)
  provisioner "remote-exec" {

    connection {
      host     = aws_instance.app.*.public_ip[count.index]
      user     = "root"
      password = "DevOps321"
    }

    inline = [
      "sudo labauto clean",
      "ansible-pull -i localhost, -U https://github.com/raghudevopsb66/roboshop-mutable-ansible roboshop.yml -e HOSTS=localhost -e APP_COMPONENT_ROLE=${var.components[count.index]} -e ENV=dev"
    ]

  }
}