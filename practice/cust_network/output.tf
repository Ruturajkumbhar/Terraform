output "aws_vpc" {
  value = aws_vpc.cust_vpc.id
}

output "aws_subnet_public" {
  value = {
    az = aws_subnet.public_subnet.availability_zone
    subnet_id = aws_subnet.public_subnet.id
    name = aws_subnet.public_subnet.tags["Name"]
  }
}

output "aws_subnet_private" {
  value = {
    az = aws_subnet.private_subnet.availability_zone
    subnet_id = aws_subnet.private_subnet.id
    name = aws_subnet.private_subnet.tags["Name"]
  }
}

output "aws_nat_gateway" {
  value = aws_nat_gateway.cust_nat.id
}