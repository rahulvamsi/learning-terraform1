terraform {
  backend "s3" {
    bucket = "terraform-rb66"
    key    = "modules/sample2/terraform.tfstate"
    region = "us-east-1"
  }
}
