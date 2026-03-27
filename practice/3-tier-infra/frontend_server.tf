
# frontend server 

resource "aws_instance" "frontend" {
  ami                    = "ami-02dfbd4ff395f2a1b"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet_1.id
  vpc_security_group_ids = [aws_security_group.frontend_sg.id]
  key_name               = aws_key_pair.backend_key.key_name

  associate_public_ip_address = true   #  public instance

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd

              echo "<h1>Frontend Server Running</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "frontend-server"
  }
}

# attached server with ALB

resource "aws_lb_target_group_attachment" "frontend_attach" {
  target_group_arn = aws_lb_target_group.frontend_tg.arn
  target_id        = aws_instance.frontend.id
  port             = 80
}

