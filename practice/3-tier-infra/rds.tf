
# ---------- subnet group ---------- 

resource "aws_db_subnet_group" "cust_subnet_grp" {
  name = var.rds_subnet_grp_name
  subnet_ids = [
    aws_subnet.private_subnet_5.id,
    aws_subnet.private_subnet_6.id
  ]
  
  tags = {
    Name = var.rds_subnet_grp_Name
  }
}

# -------------------- rds ----------------------

resource "aws_db_instance" "default" {
  allocated_storage       = var.rds_allocation_storage
  db_name                 = var.rds_name
  identifier              = var.rds_identifier
  engine                  = var.rds_engine
  engine_version          = var.rds_engine_version
  instance_class          = var.rds_instance_class

  username                = var.rds_uesrname
  password                = var.rds_password

  db_subnet_group_name    = aws_db_subnet_group.cust_subnet_grp.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]

  parameter_group_name    = var.rds_parameter_grp

  backup_retention_period = var.rds_backup_retention_period
  backup_window           = var.rds_backup_window

  monitoring_interval     = var.rds_monitoring_interval
  monitoring_role_arn     = aws_iam_role.rds_monitoring.arn

  maintenance_window      = var.rds_maintance_window

  deletion_protection     = false
  skip_final_snapshot     = true

  multi_az               = true
  publicly_accessible    = false
  storage_encrypted      = true
}

# IAM Role
resource "aws_iam_role" "rds_monitoring" {
  name = var.iam_role_name

  assume_role_policy = jsonencode({
    Version = var.iam_role_version,
    Statement = [
      {
        Action = var.iam_role_action,
        Effect = var.iam_role_effect,
        Principal = {
          Service = var.iam_role_service
        }
      }
    ]
  })
}

# Policy Attachment
resource "aws_iam_role_policy_attachment" "rds_monitoring_attach" {
  role       = aws_iam_role.rds_monitoring.name
  policy_arn = var.iam_policy_arn
}