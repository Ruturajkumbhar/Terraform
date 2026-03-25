module "prod_network" {
  source = "../../modules/network"

  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name

  public_subnet_cidr = var.public_subnet_cidr
  public_subnet_name = var.public_subnet_name


  pvt_subnet_cidr = var.pvt_subnet_cidr
  pvt_subnet_name = var.pvt_subnet_name

  cust_igw_name = var.cust_natgateway_name

  EIP_domain = var.EIP_domain
  cust_elastic_ip_name = var.cust_elastic_ip_name

  nat_availibilty_mode = var.nat_availibilty_mode
  cust_natgateway_name = var.cust_natgateway_name

  public_rt_name = var.public_rt_name
  public_rt_route_cidr = var.public_rt_route_cidr

  pvt_rt_name = var.pvt_rt_name
  pvt_rt_route_cidr = var.pvt_rt_route_cidr

  key_pair_name = var.key_pair_name

  sg_description = var.sg_description
  cust_sg_name = var.cust_sg_name

  instance_type = var.instance_type
  public_server_name = var.public_server_name

  private_server_name = var.private_server_name

}