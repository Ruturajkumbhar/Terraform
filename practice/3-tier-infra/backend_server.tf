
# key pair

resource "aws_key_pair" "backend_key" {
  key_name   = "backend-key"
  public_key = file("backend-key.pub")
}

# server 

resource "aws_instance" "backend" {
  ami                    = "ami-02dfbd4ff395f2a1b"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private_subnet_4.id
  vpc_security_group_ids = [aws_security_group.backend_sg.id]
  key_name               = aws_key_pair.backend_key.key_name

  associate_public_ip_address = false   # private instance

  user_data = <<-EOF
              #!/bin/bash
              yum update -yS
              yum install -y java-17-amazon-corretto
              # Example backend app start
              echo "Backend server is running" > /home/ec2-user/index.html
              EOF

  tags = {
    Name = "backend-server"
  }
}

