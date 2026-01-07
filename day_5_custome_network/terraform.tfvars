
#-----------------------vpc---------------------

vpc_cidr = "10.0.0.0/16"
vpc_name = "cust_vpc"

#--------------------subnet--------------------
#public subnet

pub_cidr = "10.0.0.0/24"
pub_az = "us-east-1a"
pub_subnet_name = "public_subnet"

#private subnet

pvt_cidr = "10.0.1.0/24"
pvt_az = "us-east-1b"
pvt_subnet_name = "private_subnet"

#---------------------------ig-----------------------

ig_name = "cust_ig"

#------------rt-------------------------

pub_rt_name = "public_rt"
edt_rt_cidr = "0.0.0.0/0"
pvt_rt_name = "private_rt"
pvt_edt_rt_cidr = "0.0.0.0/0"


#---------------nat-------------------

nat_eip_name = "nat_eip"
nat_gw_name = "cust_nat_gw"

#-----------------sg ----------------------

sg_description = "allow"
sg_name = "cust_sg"

#---------------key---------------------

key_algo = "RSA"
ras_bit = "4096"
key_filename = "bastion_host_key.pem"
key_file_permission= "0400"
key_pair_name = "bastion_host_key"


#------------------ec2-----------------
#public server

ami_id = "ami-068c0051b15cdb816"
pub_server_type = "t2.micro"
pub_server_name = "bastion_host"
pvt_server_name = "private_server"