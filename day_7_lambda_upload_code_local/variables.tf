
#---------------------IAM ROLE --------------------

variable "role_name" {
  type = string
  default = ""
}

variable "role_policy_version" {
  type = string
  default = ""
}

variable "iam_policy_arn" {
  type = string
  default = ""
}

variable "lambda_func_name" {
  type = string
  default = ""
}

variable "lambda_handler" {
  type = string
  default = ""
}

variable "lambda_runtime" {
  type = string
  default = ""
}