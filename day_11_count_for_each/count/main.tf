# resource "aws_instance" "name" {
#     ami = "ami-068c0051b15cdb816"
#     instance_type = "t2.micro"
#     count = 2
#     # tags = {
#     #   Name = "dev"
#     # }
#   tags ={
#     Name = "dev-${count.index}"
#   }
# }

variable "env" {
    type = list(string)
    default = ["dev","test", "prod"]
  
}

resource "aws_instance" "name" {
    ami = "ami-0532be01f26a3de55"
    instance_type = "t2.micro"
    count = length(var.env)
    tags = {
        Name = var.env[count.index]
    }
}