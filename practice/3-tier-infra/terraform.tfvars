
# ------ vpc -----

vpc_cidr = "10.0.0.0/16"
vpc_name = "cust_vpc"

# ----- subnet------

# subnet cidr blocks

public_subnet_1_cidr = "10.0.1.0/24"
public_subnet_2_cidr = "10.0.2.0/24"
private_subnet_1_cidr = "10.0.3.0/24"
private_subnet_2_cidr = "10.0.4.0/24"
private_subnet_3_cidr = "10.0.5.0/24"
private_subnet_4_cidr = "10.0.6.0/24"
private_subnet_5_cidr = "10.0.7.0/24"
private_subnet_6_cidr = "10.0.8.0/24"


# subnet names

public_subnet_name_1 = "public_subnet_1"
public_subnet_name_2 = "public_subnet_2"
private_subnet_name_1 = "private_subnet_1"
private_subnet_name_2 = "private_subnet_2"
private_subnet_name_3 = "private_subnet_3"
private_subnet_name_4 = "private_subnet_4"
private_subnet_name_5 = "private_subnet_5"
private_subnet_name_6 = "private_subnet_6"

# internet gateway

cust_igw_name = "ucust_igw"

#eip and nat gateway

cust_eip_domain = "vpc"
eip_name = "cust_eip"

nat_availibilty_mode = "regional"
nat_gateway_name = "cust_nat"

# route table and routes

private_rt_name = "public_rt"
public_rt_route_cidr = "0.0.0.0/0"

public_rt_name = "private_rt"
private_rt_route_cidr = "0.0.0.0/0"

# security group

alb_sg_name = "alb_sg"
frontend_sg_name = "frontend_sg"
backend_sg_name = "backend_sg"
rds_sg_name = "rds_sg"
nlb_sg_name = "nlb_sg"

# subnet group

rds_subnet_grp_name = "rds_subnet_grp"
rds_subnet_grp_Name = "rds_subnet_grp"

# rds


rds_allocation_storage = "10"
rds_name = "project_DB"
rds_identifier = "rds-test"
rds_engine = "mysql"
rds_engine_version = "8.0"
rds_instance_class = "db.t3.micro"
rds_uesrname = "admin"
rds_password = "abcd12345"
rds_parameter_grp = "default.mysql8.0"
rds_backup_retention_period = "7"
rds_backup_window = "02:00-03:00"
rds_monitoring_interval = "60"
rds_maintance_window = "sun:04:00-sun:05:00"

# iam

iam_role_name = "rds-monitoring-role"
iam_role_version = "2012-10-17"
iam_role_action = "sts:AssumeRole"
iam_role_effect = "Allow"
iam_role_service = "monitoring.rds.amazonaws.com"
iam_policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"