

# frontend

# launch temepalate

resource "aws_launch_template" "frontend_lt" {
  name_prefix   = "frontend-lt"
  image_id      = "ami-02dfbd4ff395f2a1b"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.backend_key.key_name

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.frontend_sg.id]
  }

  user_data = base64encode(<<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Frontend ASG Running</h1>" > /var/www/html/index.html
              EOF
  )

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "frontend-asg-instance"
    }
  }
}


# frontend asg

resource "aws_autoscaling_group" "frontend_asg" {
  desired_capacity    = 2
  max_size            = 3
  min_size            = 1

  vpc_zone_identifier = [
    aws_subnet.public_subnet_1.id,
    aws_subnet.public_subnet_2.id
  ]

  target_group_arns = [aws_lb_target_group.frontend_tg.arn]

  launch_template {
    id      = aws_launch_template.frontend_lt.id
    version = "$Latest"
  }

  health_check_type = "ELB"

  tag {
    key                 = "Name"
    value               = "frontend-asg"
    propagate_at_launch = true
  }
}


# backend 

# backend launch template

resource "aws_launch_template" "backend_lt" {
  name_prefix   = "backend-lt"
  image_id      = "ami-02dfbd4ff395f2a1b"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.backend_key.key_name

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.backend_sg.id]
  }

  user_data = base64encode(<<-EOF
              #!/bin/bash
              yum update -y
              yum install -y java-17-amazon-corretto
              echo "Backend Running" > /home/ec2-user/app.txt
              EOF
  )

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "backend-asg-instance"
    }
  }
}


# backend asg

resource "aws_autoscaling_group" "backend_asg" {
  desired_capacity    = 2
  max_size            = 3
  min_size            = 1

  vpc_zone_identifier = [
    aws_subnet.private_subnet_1.id,
    aws_subnet.private_subnet_2.id
  ]

  target_group_arns = [aws_lb_target_group.backend_tg.arn]

  launch_template {
    id      = aws_launch_template.backend_lt.id
    version = "$Latest"
  }

  health_check_type = "EC2"

  tag {
    key                 = "Name"
    value               = "backend-asg"
    propagate_at_launch = true
  }
}
