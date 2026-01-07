
#--------------vpc----------------------

variable "vpc_cidr" {
  type = string
  default = ""
}

variable "vpc_name" {
  type = string
  default = ""
}

# ------------------------ subnet----------------------
#public subnet

variable "pub_cidr" {
  type = string
  default = ""
}

variable "pub_az" {
  type = string
  default = ""
}

variable "pub_subnet_name" {
  type = string
  default = ""
}

# private subnet

variable "pvt_cidr" {
  type = string
  default = ""
}

variable "pvt_az" {
  type = string
  default = ""
}

variable "pvt_subnet_name" {
  type = string
  default = ""
}

#------------------ig creation----------------

variable "ig_name" {
  type = string
  default = ""
}

#--------------------RT--------------------

# public_rt

variable "pub_rt_name" {
  type = string
  default = ""
}

variable "edt_rt_cidr" {
  type = string
  default = ""
}

variable "pvt_rt_name" {
  type = string
  default = ""
}

# private_rt

variable "pvt_edt_rt_cidr" {
  type = string
  default = ""
}



#---------------nat gateway---------------

variable "nat_eip_name" {
    type = string
    default = ""  
}

variable "nat_gw_name" {
  type = string
  default = ""
}

#----------------security group-------------

variable "sg_description" {
  type = string
  default = ""
}

variable "sg_name" {
  type = string
  default = ""
}

#-------------keys -------------------------
variable "key_algo" {
  type = string
  default = ""
}

variable "ras_bit"{
    type = string
    default = ""
}

variable "key_filename" {
  type = string
  default = ""
}

variable "key_file_permission" {
  type = string
  default = ""
}

variable "key_pair_name" {
  type = string
  default = ""
}

#-----------------ec2------------------------

#public_server

variable "ami_id" {
  type = string
  default = ""
}

variable "pub_server_type" {
  type = string
  default = ""
}

variable "pub_server_name" {
  type = string
  default = ""
}

variable "pvt_server_name" {
  type = string
  default = ""
}


