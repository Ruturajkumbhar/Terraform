#-------------- VPC creation ----------------------------

resource "aws_vpc" "cust_vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name
  }
}

#--------------------subnet-------------------------------------------

#----az---------

data "aws_availability_zones" "name" {
  
}

#------------ public subnet ---------------

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.cust_vpc.id
  availability_zone = data.aws_availability_zones.name.names[0]
  cidr_block = var.public_subnet_cidr

  tags = {
    Name = var.public_subnet_name
  }
}

#------ private subnet ----------------

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.cust_vpc.id
  availability_zone = data.aws_availability_zones.name.names[1]
  cidr_block = var.pvt_subnet_cidr

  tags = {
    Name = var.pvt_subnet_name
  }
}


#------------------ Internet Gateway ------------------------

resource "aws_internet_gateway" "cust_igw" {
  vpc_id = aws_vpc.cust_vpc.id

  tags = {
    Name = var.cust_igw_name
  }
}


#resource "aws_internet_gateway_attachment" "igw_attach" {
 # vpc_id = aws_vpc.cust_vpc.id
  #internet_gateway_id = aws_internet_gateway.cust_igw.id
#}

#------------elastic ip ---------------------

resource "aws_eip" "cust_eip" {
  domain = var.EIP_domain

  tags = {
    Name = var.cust_elastic_ip_name
  }
}

resource "aws_nat_gateway" "cust_nat" {
  allocation_id = aws_eip.cust_eip.id
  availability_mode = var.nat_availibilty_mode
  vpc_id = aws_vpc.cust_vpc.id

  tags = {
    Name = var.cust_natgateway_name
  }

  depends_on = [ aws_internet_gateway.cust_igw ]
}


#------------------ route table ---------------

#-------- public rt------------

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.cust_vpc.id
  
  tags = {
    Name = var.public_rt_name
  }
}

resource "aws_route" "public_route" {
  route_table_id = aws_route_table.public_rt.id
  destination_cidr_block = var.public_rt_route_cidr
  gateway_id = aws_internet_gateway.cust_igw.id
}

resource "aws_route_table_association" "public_rt_association" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

#--------- private rt -----------------

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.cust_vpc.id

  tags = {
    Name = var.pvt_rt_name
  }
}

resource "aws_route" "pvt_rt_route" {
  route_table_id = aws_route_table.private_rt.id
  destination_cidr_block = var.pvt_rt_route_cidr
  nat_gateway_id = aws_nat_gateway.cust_nat.id
}

resource "aws_route_table_association" "pvt_rt_association" {
  subnet_id = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}

#------------------ key pair ------------------

resource "aws_key_pair" "key_pair" {
  key_name   = var.key_pair_name
  public_key = file("D:/Terraform/Terraform/practice/modules_practice/my-key.pub")
}

#------------------ security group ------------

resource "aws_security_group" "cust_sg" {
  vpc_id = aws_vpc.cust_vpc.id
  description = var.sg_description

  tags = {
    Name = var.cust_sg_name
  }

  ingress {
    description = "Allow ssh traffic"
    from_port = "22"
    to_port = "22"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
   description = "Allow http traffic"
   from_port = "80"
   to_port = "80"
   protocol = "tcp"
   cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }  
}

#------------------- ec2 server ---------------

data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = [ "amazon" ]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name = "state"
    values = ["available"]
  }
}

# public server

resource "aws_instance" "public_server" {
  ami = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  key_name = aws_key_pair.key_pair.key_name
  subnet_id = aws_subnet.public_subnet.id
  vpc_security_group_ids = [ 
    aws_security_group.cust_sg.id
   ]

  associate_public_ip_address = true

  tags = {
    Name = var.public_server_name
  }
}

# private server

resource "aws_instance" "private_server" {
  ami = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  key_name = aws_key_pair.key_pair.key_name
  subnet_id = aws_subnet.private_subnet.id

  vpc_security_group_ids = [  
    aws_security_group.cust_sg.id
  ]

  tags = {
    Name = var.private_server_name
  }
}