resource "aws_instance" "cust_ec2" {
  ami = var.ami_id
  instance_type = var.instance_type

  subnet_id = var.subnet_id
  vpc_security_group_ids = [  
        var.security_group
  ]

  key_name = var.key_pair

  associate_public_ip_address = true

  tags = {
    Name = var.instance_name
  }
}