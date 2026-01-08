resource "aws_db_instance" "default" {
  allocated_storage       = var.rds_storage
  db_name                 = var.rds_name
  identifier              = var.identifier
  engine                  = var.rds_engine
  engine_version          = var.rds_engine_version
  instance_class          = var.instance_class
  username                = var.rds_uesrname
# manage_master_user_password = true #rds and secret manager manage this password
  password                = var.rds_pass
  db_subnet_group_name    = aws_db_subnet_group.sub-grp.id
  parameter_group_name    = var.parameter_grp_name

  # Enable backups and retention
  backup_retention_period  = var.retantion_time  # Retain backups for 7 days
  backup_window            = var.backup_window # Daily backup window (UTC)

  # Enable monitoring (CloudWatch Enhanced Monitoring)
  monitoring_interval      = var.monitoring_interval  # Collect metrics every 60 seconds
  monitoring_role_arn      = aws_iam_role.rds_monitoring.arn

  # Enable performance insights
  # performance_insights_enabled          = true
  # performance_insights_retention_period = 7  # Retain insights for 7 days

  # Maintenance window
  maintenance_window = var.maintenance_window  # Maintenance every Sunday (UTC)

  # Enable deletion protection (to prevent accidental deletion)
  deletion_protection = false

  # Skip final snapshot
  skip_final_snapshot = true
  
}

# # IAM Role for RDS Enhanced Monitoring
resource "aws_iam_role" "rds_monitoring" {
  name = var.iam_name
  assume_role_policy = jsonencode({
    Version = var.iam_version 
      Statement = [{
      Action = var.iam_action
      Effect = var.iam_effect
      Principal = {
        Service = var.iam_service
      }
    }]
  })
}

#IAM Policy Attachment for RDS Monitoring
resource "aws_iam_role_policy_attachment" "rds_monitoring_attach" {
  role       = aws_iam_role.rds_monitoring.name
  policy_arn = var.iam_policy_arn
}


# resource "aws_db_subnet_group" "sub-grp" {
#   name       = "mycutsubnet"
#   subnet_ids = ["subnet-07395049b5d813a79", "subnet-0d2209bc56450d423"]

#   tags = {
#     Name = "My DB subnet group"
#   }
# }


resource "aws_vpc" "name" {
    cidr_block = var.vpc_cidr
    tags = {
      Name = var.vpc_name
    }
  
}
resource "aws_subnet" "subnet-1" {
    vpc_id = aws_vpc.name.id
    cidr_block = var.subnet_1_cidr
    availability_zone = var.subnet_1_az
  
}
resource "aws_subnet" "subnet-2" {
    vpc_id = aws_vpc.name.id
    cidr_block = var.subnet_2_cidr
    availability_zone = var.subnet_2_az
  
}
resource "aws_db_subnet_group" "sub-grp" {
  name       = var.db_subnet_grp_name
  subnet_ids = [aws_subnet.subnet-1.id, aws_subnet.subnet-2.id]

  tags = {
    Name = var.db_subntegrp_tag_name
  }
}

####### with data source ###########
# data "aws_subnet" "subnet_1" {
#   filter {
#     name   = "tag:Name"
#     values = ["subnet-1"]
#   }
# }

# data "aws_subnet" "subnet_2" {
#   filter {
#     name   = "tag:Name"
#     values = ["subnet-2"]
#   }
# # }
# resource "aws_db_subnet_group" "sub-grp" {
#   name       = "mycutsubnet"
#   subnet_ids = [data.aws_subnet.subnet_1.id, data.aws_subnet.subnet_2.id]

#   tags = {
#     Name = "My DB subnet group"
#   }
# }

resource "aws_s3_bucket" "name" {
    bucket = var.bucket_name
    
  
}