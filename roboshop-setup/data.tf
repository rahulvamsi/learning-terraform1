data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "centos7-devops-practice-with-ansible"
  owners      = ["self"]
}
