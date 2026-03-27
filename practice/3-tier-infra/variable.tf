
# ----- vpc -----

variable "vpc_cidr" {
  type = string
  description = "vpc cidr block"
}

variable "vpc_name" {
  type = string
  description = "vpc name"
}

# ----- subnets -----

# public subnet 1

variable "public_subnet_1_cidr" {
  type = string
  description = "cidr block of public subnet 1"
}

variable "public_subnet_name_1" {
  type = string
  description = "name of public subnet 1"
}

# public subnet 2

variable "public_subnet_2_cidr" {
  type = string
  description = "cidr block of public subnet 2"
}

variable "public_subnet_name_2" {
  type = string
  description = "name of public subnet 2"
}

# private subnet 1

variable "private_subnet_1_cidr" {
  type = string
  description = "cidr block of private subnet 1"
}

variable "private_subnet_name_1" {
  type = string
  description = "name of private subnet 1"
}


# private subnet 2

variable "private_subnet_2_cidr" {
  type = string
  description = "cidr block of private subnet 2"
}

variable "private_subnet_name_2" {

  type = string
  description = "name of private subnet 2"
}


# private subnet 3

variable "private_subnet_3_cidr" {
  type = string
  description = "cidr block of private subnet 3"
}

variable "private_subnet_name_3" {
  type = string
  description = "name of private subnet 3"
}

# private subnet 4

variable "private_subnet_4_cidr" {
  type = string
  description = "cidr block of private subnet 4"
}

variable "private_subnet_name_4" {
  type = string
  description = "name of private subnet 4"
}

# private subnet 5

variable "private_subnet_5_cidr" {
  type = string
  description = "cidr block of private subnet 5"
}

variable "private_subnet_name_5" {
  type = string
  description = "name of private subnet 5"
}

# private subnet 6

variable "private_subnet_6_cidr" {
  type = string
  description = "cidr block of private subnet 6"
}

variable "private_subnet_name_6" {
  type = string
  description = "name of private subnet 6"
}

# internet gateway

variable "cust_igw_name" {
  type = string
  description = "name of custome internate gateway"
}

# eip  and nat gateway

variable "cust_eip_domain" {
  type = string
  description = "elastic ip"
}

variable "eip_name" {
  type = string
  description = "name of elastic ip"
}

variable "nat_availibilty_mode" {
  type = string
  description = "mode of elastic ip"
}

variable "nat_gateway_name" {
  type = string
  description = "name of the nat gateway"
}

# route table 

# public rt

variable "public_rt_name" {
  type = string
  description = "name of public route table"
}

variable "public_rt_route_cidr" {
  type = string
  description = "cidr block of the rote of public route table"
}

# private rt

variable "private_rt_name" {
  type = string
  description = "name of private route table"
}

variable "private_rt_route_cidr" {
  type = string
  description = "cidr block of the private route table route "
}

# -------- security group -------------

variable "alb_sg_name" {
  type = string
  description = "name of alb security group"
}

variable "frontend_sg_name" {
  type = string
  description = "name of forntend sg"
}

variable "backend_sg_name" {
  type = string
  description = "name of backend sg"
}

variable "rds_sg_name" {
  type = string
  description = "name of rds sg"
}

variable "nlb_sg_name" {
  type = string
  description = "name of nlb sg"
}

# ---------------- rds subnet group and rds ------------------------

variable "rds_subnet_grp_name" {
  type = string
  description = "name of the rds subnet group"
}

variable "rds_subnet_grp_Name" {
  type = string
  description = "Nmae of the rds subnet group"
}


# RDS

variable "rds_allocation_storage" {
  type = string
  description = "storage allocation for rds"
}

variable "rds_name" {
  type = string
  description = "name of rds database"
}

variable "rds_identifier" {
  type = string
  description = "rds indentifier"
}

variable "rds_engine" {
  type = string
  description = "engine for the rds database"
}

variable "rds_engine_version" {
  type = string
  description = "engine version of rds"
}

variable "rds_instance_class" {
    type = string
    description = "instance class of rds"
}

variable "rds_uesrname" {
  type = string
  description = "username of the rds"
}

variable "rds_password" {
  type = string
  description = "password if rds"
}

variable "rds_parameter_grp" {
  type = string
  description = "parameter group of rds"
}

variable "rds_backup_retention_period" {
  type = string
  description = "backup retention period of rds "
}

variable "rds_backup_window" {
  type = string
  description = "window backup of rds"
}

variable "rds_monitoring_interval" {
  type = string
  description = "monitoring interval of rds"
}

variable "rds_maintance_window" {
  type = string
  description = "maintanence window of rds"
}

# iam role

variable "iam_role_name" {
  type = string
  description = "name of the iam role"
}

variable "iam_role_version" {
  type = string
  description = "role version of the iam role"
}

variable "iam_role_action" {
  type = string
  description = "action of the iam role"
}

variable "iam_role_effect" {
  type = string
  description = "effect of iam role"
}

variable "iam_role_service" {
  type = string
  description = "service of iam role"
}

variable "iam_policy_arn" {
  type = string
  description = "arm of iam policy"
}

