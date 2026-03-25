variable "region" {
    type = string
    description = "aws region"
}

variable "ami" {
    type = string
    description = "Amazon linux server aim Id"
}

variable "instance_type" {
    type = string
    description = "Instance type"
}

variable "key_pair_name" {
  type = string
  description = "name of key pair"
}

variable "private_key_path" {
  type = string
  description = "path of the private key"
}

variable "public_key_path" {
  type = string
  description = "path of public key"
}