terraform {
  backend "s3" {
    bucket = "terraform-b66"
    key    = "modules/sample1/terraform.tfstate"
    region = "us-east-1"
  }
}
