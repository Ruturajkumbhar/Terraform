terraform {
  backend "s3" {
    bucket = "project-s3-bucket-demo"
    key = "terraform.tfsate"
    region = "us-east-1"
  }
}