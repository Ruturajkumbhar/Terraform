resource "aws_instance" "name" {
  ami =  "ami-07ff62358b87c7116"
  instance_type = "t2.micro"
  tags = {
    Name = "ec2"
  }
}

resource "aws_s3_bucket" "name" {
  bucket = "asdsffdgfghgfhhjklklqwerw"

}

resource "aws_s3_bucket_versioning" "s3_versioning" {
  bucket = aws_s3_bucket.name.id
  versioning_configuration {
    status = "Enabled"
  }
}