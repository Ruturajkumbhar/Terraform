resource "aws_instance" "server" {
  ami = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = var.server_name
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  depends_on = [ aws_instance.server ]
}