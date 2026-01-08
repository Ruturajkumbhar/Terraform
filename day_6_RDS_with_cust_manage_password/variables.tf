
# -----------------------rds-----------------------

variable "rds_storage" {
  type = string
  default = ""
}

variable "rds_name" {
  type = string
  default = ""
}

variable "identifier" {
  type = string
  default = ""
}

variable "rds_engine" {
  type = string
  default = ""
}

variable "rds_engine_version" {
  type = string
  default = ""
}
variable "instance_class" {
  type = string
  default = ""
}

variable "rds_uesrname" {
  type = string
  default = ""
}

variable "rds_pass" {
  type = string
  default = ""
}

variable "parameter_grp_name" {
  type = string
  default = ""
}

variable "retantion_time" {
  type = string
  default = ""
}

variable "backup_window" {
  type = string
  default = ""
}

variable "monitoring_interval" {
  type = string
  default = ""
}

variable "maintenance_window" {
  type = string
  default = ""
}

#---------------------------IAM----------------------------

variable "iam_name" {
  type = string
  default = ""
}

variable "iam_version" {
  type = string
  default = ""
}

variable "iam_action" {
  type = string
  default = ""
}

variable "iam_effect" {
  type = string
  default = ""
}

variable "iam_service" {
  type = string
  default = ""
}

#policy

variable "iam_policy_arn" {
  type = string
  default = ""
}

#-----------------VPC----------------------

variable "vpc_cidr" {
  type = string
  default = ""
}

variable "vpc_name" {
  type = string
  default = ""
}

#--------------------subnet-------------------------

#subnet_1

variable "subnet_1_cidr" {
  type = string
  default = ""
}

variable "subnet_1_az" {
  type = string
  default = ""
}

#subnet_2

variable "subnet_2_cidr" {
  type = string
  default = ""
}

variable "subnet_2_az" {
  type = string
  default = ""
}

#db_subnet_grp

variable "db_subnet_grp_name" {
  type = string
  default = ""
}

variable "db_subntegrp_tag_name" {
  type = string
  default = ""
}

#-------------------s3----------------------

variable "bucket_name" {
  type = string
  default = ""
}