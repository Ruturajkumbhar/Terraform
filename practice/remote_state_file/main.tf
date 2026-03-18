resource "aws_instance" "cust_ec2"{
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_pair_name
  vpc_security_group_ids = [
      var.sg_id
  ]

  subnet_id = var.subnet_id
  associate_public_ip_address = true

  tags = {
    Name = var.instance_name
  }
}