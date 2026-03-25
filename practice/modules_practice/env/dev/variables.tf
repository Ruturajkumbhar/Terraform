#----------------------vpc---------------------

variable "vpc_cidr" {
    type        = string
    description = "vpc cidr block"
}

variable "vpc_name" {
  type = string
  description = "vpc name"
}


# -----------------------subnets-----------------------
#----------- public subnet-----------

variable "public_subnet_cidr" {
  type = string
  description = "Public subnet cidr block"
}

variable "public_subnet_name" {
  type = string
  description = "Public Subnet Name"
}

#----------- private subnet----------

variable "pvt_subnet_cidr" {
  type = string
  description = "Private subnet cidr"
}

variable "pvt_subnet_name" {
  type = string
  description = "Private subnet name"
}

#------------ igw --------------

variable "cust_igw_name" {
  type = string
  description = "Internate Gateway Name"
}

#--------------- elastic ip and Nat Gateway -----------------

variable "cust_elastic_ip_name" {
  type = string
  description = "Elastic Ip Name for the Nat Gataway"
}

variable "EIP_domain" {
  type = string
  description = "Domain of Elastic IP"
}

variable "cust_natgateway_name" {
  type = string
  description = "Nat Gateway Name"
}

variable "nat_availibilty_mode" {
  type = string
  description = "Availibilty mode of the nat gateway"
}


#----------------- route tables ---------------------

#----------- public rt -----------

variable "public_rt_name" {
  type = string
  description = "Public route table name"
}

variable "public_rt_route_cidr" {
  type = string
  description = "Public route table route cidr block"
}

#-------- pvt rt ------------

variable "pvt_rt_name" {
  type = string
  description = "private route table name"
}

variable "pvt_rt_route_cidr" {
  type = string
  description = "private route table route cidr block"
}

variable "key_pair_name" {
  type = string
  description = "key pair name"
}

#------------------- security group -----------------

variable "cust_sg_name" {
  type = string
  description = "Name of the security group"
}

variable "sg_description" {
  type = string
  description = "description for security group"
}

#---------- ec2 instace --------------

# ------- public server ------

variable "instance_type" {
  type = string
  description = "ec2 instance type"
}

variable "public_server_name" {
 type = string
 description = "public server name"
}

#---- private server

variable "private_server_name" {
  type = string
  description = "name of the private server"
}