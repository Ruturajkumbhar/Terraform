# ---------- VPC Creation --------

resource "aws_vpc" "cust_vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name
  }
}

# ---------- subnets ----------

data "aws_availability_zones" "name" {
  
}

# public subnet 1

resource "aws_subnet" "public_subnet_1" {
  vpc_id = aws_vpc.cust_vpc.id
  cidr_block = var.public_subnet_1_cidr
  availability_zone = data.aws_availability_zones.name.names[0]

  tags = {
    Name = var.public_subnet_name_1
  }

}

# public subnet 2

resource "aws_subnet" "public_subnet_2" {
  vpc_id = aws_vpc.cust_vpc.id
  cidr_block = var.public_subnet_2_cidr
  availability_zone = data.aws_availability_zones.name.names[1]

  tags = {
    Name = var.public_subnet_name_2
  }

}

# private subnet 1 (frontend 1)

resource "aws_subnet" "private_subnet_1" {
  vpc_id = aws_vpc.cust_vpc.id
  cidr_block = var.private_subnet_1_cidr
  availability_zone = data.aws_availability_zones.name.names[0]

  tags = {
    Name = var.private_subnet_name_1
  }

}

# private subnet 2 (frontend 2)

resource "aws_subnet" "private_subnet_2" {
  vpc_id = aws_vpc.cust_vpc.id
  cidr_block = var.private_subnet_2_cidr
  availability_zone = data.aws_availability_zones.name.names[1]

  tags = {
    Name = var.private_subnet_name_2
  }

}

# private subnet 3 (backend 1)

resource "aws_subnet" "private_subnet_3" {
  vpc_id = aws_vpc.cust_vpc.id
  cidr_block = var.private_subnet_3_cidr
  availability_zone = data.aws_availability_zones.name.names[0]

  tags = {
    Name = var.private_subnet_name_3
  }

}

# private subnet 4 (backend 2)

resource "aws_subnet" "private_subnet_4" {
  vpc_id = aws_vpc.cust_vpc.id
  cidr_block = var.private_subnet_4_cidr
  availability_zone = data.aws_availability_zones.name.names[1]

  tags = {
    Name = var.private_subnet_name_4
  }

}

# private subnet 5 (DB 1)

resource "aws_subnet" "private_subnet_5" {
  vpc_id = aws_vpc.cust_vpc.id
  cidr_block = var.private_subnet_5_cidr
  availability_zone = data.aws_availability_zones.name.names[0]

  tags = {
    Name = var.private_subnet_name_5
  }

}

# private subnet 6 (DB 2)

resource "aws_subnet" "private_subnet_6" {
  vpc_id = aws_vpc.cust_vpc.id
  cidr_block = var.private_subnet_6_cidr
  availability_zone = data.aws_availability_zones.name.names[1]

  tags = {
    Name = var.private_subnet_name_6
  }

}

# -------- internet gateway ------------------

resource "aws_internet_gateway" "cust_igw" {
  vpc_id = aws_vpc.cust_vpc.id

  tags = {
    Name = var.cust_igw_name
  }
}

# elastic ip and nat gateway


resource "aws_eip" "cust_eip" {
    domain = var.cust_eip_domain

    tags = {
      Name = var.eip_name
    }
  
}

resource "aws_nat_gateway" "cust_nat" {
  vpc_id = aws_vpc.cust_vpc.id
  allocation_id = aws_eip.cust_eip.id
  availability_mode = var.nat_availibilty_mode

  tags = {
    Name = var.eip_name
  }

   depends_on = [ aws_internet_gateway.cust_igw ]
}

# ---------- route table ----------

# public route table

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

resource "aws_route_table_association" "public_rt_association_1" {
  subnet_id = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_rt_association_2" {
  subnet_id = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}


# private route table

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.cust_vpc.id

  tags = {
    Name = var.private_rt_name
  }
}

resource "aws_route" "pvt_rt_route" {
  route_table_id = aws_route_table.private_rt.id
  destination_cidr_block = var.private_rt_route_cidr
  nat_gateway_id = aws_nat_gateway.cust_nat.id
}

resource "aws_route_table_association" "pvt_rt_association_1" {
  subnet_id = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "pvt_rt_association_2" {
  subnet_id = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "pvt_rt_association_3" {
  subnet_id = aws_subnet.private_subnet_3.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "pvt_rt_association_4" {
  subnet_id = aws_subnet.private_subnet_4.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "pvt_rt_association_5" {
  subnet_id = aws_subnet.private_subnet_5.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "pvt_rt_association_6" {
  subnet_id = aws_subnet.private_subnet_6.id
  route_table_id = aws_route_table.private_rt.id
}

