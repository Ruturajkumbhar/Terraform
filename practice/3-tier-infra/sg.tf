# -------------- ALB sg ----------------------

resource "aws_security_group" "alb_sg" {
  name        = "alb-sg"
  description = "Allow HTTP/HTTPS traffic from internet"
  vpc_id      = aws_vpc.cust_vpc.id

  ingress {
    description = "HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.alb_sg_name
  }
}

# ----------------------  Frontend Security Group --------------------------

resource "aws_security_group" "frontend_sg" {
  name        = "frontend-sg"
  description = "Allow traffic from ALB"
  vpc_id      = aws_vpc.cust_vpc.id

  ingress {
    description     = "Allow traffic from ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.frontend_sg_name
  }
}

# -------------------- Backend Security Group ----------------

resource "aws_security_group" "backend_sg" {
  name        = "backend-sg"
  description = "Allow traffic from frontend"
  vpc_id      = aws_vpc.cust_vpc.id

  ingress {
    description     = "Allow traffic from frontend"
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.frontend_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.backend_sg_name
  }
}


# ------------------ RDS Security Group --------------------- 

resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Allow DB access from backend"
  vpc_id      = aws_vpc.cust_vpc.id

  ingress {
    description     = "MySQL access from backend"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.backend_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.rds_sg_name
  }
}


# ------------------------- NLB Security Group --------------------

resource "aws_security_group" "nlb_sg" {
  name        = "nlb-sg"
  description = "Allow TCP traffic"
  vpc_id      = aws_vpc.cust_vpc.id

  ingress {
    description = "Allow TCP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.nlb_sg_name
  }
}