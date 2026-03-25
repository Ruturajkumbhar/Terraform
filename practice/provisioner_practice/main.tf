resource "aws_key_pair" "key_pair" {
  key_name   = var.key_pair_name
  public_key = file(var.public_key_path)
}

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type


  key_name = aws_key_pair.key_pair.key_name

  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name = "AmazonLinux-Provisioner"
  }

  #  CONNECTION
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file(var.private_key_path)
    host        = self.public_ip
    timeout     = "2m"
  }

  # FILE PROVISIONER
  provisioner "file" {
    source      = "file10"
    destination = "/home/ec2-user/file10"
  }

  # REMOTE EXEC
  provisioner "remote-exec" {
    inline = [
      "touch /home/ec2-user/file200",
      "echo 'Hello from Amazon Linux ' >> /home/ec2-user/file200"
    ]
  }

  # 🖥️ LOCAL EXEC
  provisioner "local-exec" {
    command = "echo EC2 Created with IP: ${self.public_ip} > output.txt"
  }
}

# Security Group
resource "aws_security_group" "sg" {
  name = "allow_ssh_amazon_linux"

  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}