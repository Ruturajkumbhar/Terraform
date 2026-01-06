terraform {
  backend "s3" {
    bucket = "s3-bucket-demo-projecr-rk"
    key = "terraform.tftstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-lock-dynamodb"
  }
}