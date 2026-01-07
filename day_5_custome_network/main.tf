
# ---------------- vpc creation --------------------

resource "aws_vpc" "cust_vpc" {
 cidr_block = var.vpc_cidr
 tags = {
    Name= var.vpc_name
 } 

}


#---------------- subnet creation ---------------------

# public subnet

resource "aws_subnet" "pub_subnet" {
  vpc_id = aws_vpc.cust_vpc.id
  cidr_block = var.pub_cidr
  availability_zone = var.pub_az
  tags = {
    Name = var.pub_subnet_name
  }

}

#private subnet

resource "aws_subnet" "pvt_subnet" {
  vpc_id = aws_vpc.cust_vpc.id
  cidr_block = var.pvt_cidr
  availability_zone = var.pvt_az
  tags = {
    Name = var.pvt_subnet_name
  }
}

#----------------- IG creation and attached to vpc-------------------

resource "aws_internet_gateway" "cust_ig" {
    vpc_id = aws_vpc.cust_vpc.id
  tags = {
    Name = var.ig_name
  }
}

#resource "aws_internet_gateway_attachment" "ig_attach" {
 # internet_gateway_id = aws_internet_gateway.cust_ig.id  
  #vpc_id = aws_vpc.cust_vpc.id
#}

#-------------------------RT creation and edit routes and route association -----------------------

#public route table
resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.cust_vpc.id
  tags = {
    Name = var.pub_rt_name
  }

  route {
    cidr_block = var.edt_rt_cidr
    gateway_id = aws_internet_gateway.cust_ig.id
  }
}

resource "aws_route_table_association" "pub_rt_assosciation" {
  subnet_id = aws_subnet.pub_subnet.id
  route_table_id = aws_route_table.pub_rt.id
}

#private route table 

resource "aws_route_table" "pvt_rt" {
  vpc_id = aws_vpc.cust_vpc.id
  tags = {
    Name = var.pvt_rt_name
  }
  route {
    cidr_block = var.pvt_edt_rt_cidr
    nat_gateway_id = aws_nat_gateway.cust_ng.id

  }
}

resource "aws_route_table_association" "name" {
  subnet_id = aws_subnet.pvt_subnet.id
  route_table_id = aws_route_table.pvt_rt.id
}


#----------------nat gatway-------------

resource "aws_eip" "nat_ip" {
  tags = {
    Name = var.nat_eip_name
  }
}

resource "aws_nat_gateway" "cust_ng" {
allocation_id = aws_eip.nat_ip.id
subnet_id = aws_subnet.pub_subnet.id
tags = {
  Name = var.nat_gw_name
}
}


#---------------------security group----------------

resource "aws_security_group" "cust_sg" {
  description = var.sg_description
  vpc_id = aws_vpc.cust_vpc.id
  tags = {
    Name = var.sg_name
  }

  ingress {
    description = "HTTP"
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#------------------key pair creation -----------------------

resource "tls_private_key" "ssh_key" {
  algorithm = var.key_algo
  rsa_bits = var.ras_bit
}

resource "local_file" "pvt_key" {
  filename = var.key_filename
  content = tls_private_key.ssh_key.private_key_pem
  file_permission = var.key_file_permission
}

resource "aws_key_pair" "key_pair" {
  key_name = var.key_pair_name
  public_key = tls_private_key.ssh_key.public_key_openssh
}

#------------ec2 creation -------------------

# public server

resource "aws_instance" "pub_server" {
  ami = var.ami_id
  instance_type = var.pub_server_type
  tags = {
    Name = var.pub_server_name
  }
  vpc_security_group_ids = [aws_security_group.cust_sg.id]
  subnet_id = aws_subnet.pub_subnet.id
  associate_public_ip_address = true
  key_name = aws_key_pair.key_pair.key_name
  
}


#private server

resource "aws_instance" "pvt_server" {
  ami = var.ami_id
  instance_type = var.pub_server_type
  tags = {
    Name = var.pvt_server_name
  }
  vpc_security_group_ids = [aws_security_group.cust_sg.id]
  subnet_id = aws_subnet.pvt_subnet.id
  key_name = aws_key_pair.key_pair.key_name
}




