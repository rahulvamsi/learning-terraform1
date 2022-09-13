data "aws_instances" "test" {
  instance_state_names = ["running", "stopped"]
}

output "instances" {
  value = data.aws_instances.test
}
