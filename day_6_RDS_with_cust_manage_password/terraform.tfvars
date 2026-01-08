
# ----------------------RDS---------------------

rds_storage = "10"
rds_name = "mydb"
identifier = "rds-test"
rds_engine = "mysql"
rds_engine_version = "8.0"
instance_class = "db.t3.micro"
rds_uesrname = "admin"
rds_pass = "Cloud123"
parameter_grp_name = "default.mysql8.0"
retantion_time = "7"
backup_window = "02:00-03:00"
monitoring_interval = "60"
maintenance_window = "sun:04:00-sun:05:00"

#---------------------IAM------------------------------

iam_name = "rds-monitoring-role"
iam_version = "2012-10-17"
iam_action = "sts:AssumeRole"
iam_effect = "Allow"
iam_service = "monitoring.rds.amazonaws.com"
iam_policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"

#------------------------------VPC----------------------

vpc_cidr = "10.0.0.0/16"
vpc_name = "dev"

#----------------subnet--------------------
#subnet_1

subnet_1_cidr = "10.0.0.0/24"
subnet_1_az = "us-east-1a"

#subnet_2

subnet_2_cidr = "10.0.1.0/24"
subnet_2_az = "us-east-1b"

#db_subnet_grp

db_subnet_grp_name = "mycutsubnett"
db_subntegrp_tag_name = "My DB subnet group"


#-----------------------s3 bucket----------------

bucket_name = "s3-bucket-demo-project-rk"