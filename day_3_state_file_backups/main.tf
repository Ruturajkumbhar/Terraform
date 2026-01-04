resource "aws_instance" "name" {
  
  ami = var.ami_id
  instance_type = var.type

  tags = {
    Name = var.Name
  }

}

resource "aws_s3_bucket" "dev" {
  bucket = var.bucket_name
}