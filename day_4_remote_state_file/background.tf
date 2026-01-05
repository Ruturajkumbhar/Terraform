terraform {
  backend "s3" {
    bucket = "project-s3-bucket-demo"
    key = "terraform.tfsate"
    region = "us-east-1"

    # Enable s3 native locking
    use_lockfile = true
    
  }
}