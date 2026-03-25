
# -----------------------rds-----------------------

variable "rds_storage" {
  type = string
  description = "RDS allocated storage"
}

variable "rds_name" {
  type = string
  description = "RDS database name"
}

variable "identifier" {
  type = string
  description = "RDS identifier"
}

variable "rds_engine" {
  type = string
  description = "RDS Engine"
}

variable "rds_engine_version" {
  type = string
  description = "RDS engine version"
}
variable "instance_class" {
  type = string
  description = "RDS instance class"
}

variable "rds_uesrname" {
  type = string
  description = "RDS username"
}

variable "rds_pass" {
  type = string
  description = "RDS Password"
}

variable "parameter_grp_name" {
  type = string
  description = "RDS parameter group"
}

variable "retantion_time" {
  type = string
  description = "RDS relation time"
}

variable "backup_window" {
  type = string
  description = "RDS backup window"
}

variable "monitoring_interval" {
  type = string
  description = "RDS monitoring interval"
}

variable "maintenance_window" {
  type = string
  description = "RDS maintenance windows"
}

#---------------------------IAM----------------------------

variable "iam_name" {
  type = string
  description = "IAM role name"
}

variable "iam_version" {
  type = string
  description = "IAM role version"
}

variable "iam_action" {
  type = string
  description = "IAM role action"
}

variable "iam_effect" {
  type = string
  description = "IAM role effect"
}

variable "iam_service" {
  type = string
  description = "IAM role service"
}

#policy

variable "iam_policy_arn" {
  type = string
  description = "IAM policy arn"
}

#-----------------VPC----------------------

variable "vpc_cidr" {
  type = string
  description = "vpc cidr block"
}

variable "vpc_name" {
  type = string
  description = "vpc name"
}

#--------------------subnet-------------------------

#subnet_1

variable "subnet_1_cidr" {
  type = string
  description = "subnet 1 cidr block"
}

variable "subnet_1_az" {
  type = string
  description = "subnet 1 availibility zone"
}

#subnet_2

variable "subnet_2_cidr" {
  type = string
  description = "subnet 2 cidr block"
}

variable "subnet_2_az" {
  type = string
  description = "subnet 2 availibility zone"
}

#db_subnet_grp

variable "db_subnet_grp_name" {
  type = string
  description = "RDS subnet group name"
}

variable "db_subntegrp_tag_name" {
  type = string
  description = "RDS subnet group tag"
}



