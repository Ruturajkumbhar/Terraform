# variable "create_ec2" {
#   type    = bool
#   default = false
# }

# resource "aws_instance" "app" {
#   count = var.create_ec2 ? 1 : 0

#   ami           = "ami-068c0051b15cdb816"
#   instance_type = "t2.micro"
# }


variable "azs" {
  default = ["us-east-1a", "us-west-1b"]
}

resource "aws_subnet" "public" {
  count             = length(var.azs)
  vpc_id            = "vpc-041368ae9d06d4bf2"
  cidr_block        = "10.0.${count.index}.0/24"
  availability_zone = var.azs[count.index]

  tags = {
    Name = "public-${count.index}"
  }
}