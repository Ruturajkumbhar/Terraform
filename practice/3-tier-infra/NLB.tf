# target group

resource "aws_lb_target_group" "backend_tg" {
  name        = "backend-tg"
  port        = 8080
  protocol    = "TCP"
  vpc_id      = aws_vpc.cust_vpc.id

  health_check {
    protocol = "TCP"
    port     = "8080"
  }

  tags = {
    Name = "backend-tg"
  }
}


# network load balancer

resource "aws_lb" "backend_nlb" {
  name               = "backend-nlb"
  internal           = true   #  internal for backend
  load_balancer_type = "network"

  subnets = [
    aws_subnet.private_subnet_1.id,
    aws_subnet.private_subnet_2.id
  ]

  tags = {
    Name = "backend-nlb"
  }
}

#loadbalancer listener

resource "aws_lb_listener" "backend_listener" {
  load_balancer_arn = aws_lb.backend_nlb.arn
  port              = 8080
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.backend_tg.arn
  }
}

