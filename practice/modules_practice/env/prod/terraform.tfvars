#--------------vpc-------------------------

vpc_cidr = "10.1.0.0/16"
vpc_name = "prod_cust_vpc"

#-------------- subnet ----------------

public_subnet_cidr = "10.1.1.0/24"
public_subnet_name = "prod_public_subnet"

pvt_subnet_cidr = "10.1.2.0/24"
pvt_subnet_name = "prod_Private_subnet"

#-------------- igw -----------------

cust_igw_name = "prod_cust_igw"

#------------- elastic ip and nat gateway -------------

cust_elastic_ip_name = "prod_cust_EIP"
EIP_domain = "vpc"
cust_natgateway_name = "prod_cust_nat"
nat_availibilty_mode = "regional"


#--------------- route table ---------------------

public_rt_name = "prod_Public_rt"
public_rt_route_cidr = "0.0.0.0/0"

pvt_rt_name = "prod_private_rt"
pvt_rt_route_cidr = "0.0.0.0/0"

#----------- key pair -----------

key_pair_name = "key-pair"

# -------------- sg ---------------

cust_sg_name = "prod_cust_sg"
sg_description = "Allow ssh and http traffic"

#--------- ec2 instace --------

# --- public

instance_type = "t2.micro"
public_server_name = "prod_Bastion_host"

#----- private

private_server_name = "prod_Application_server"


