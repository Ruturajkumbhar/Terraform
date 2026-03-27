output "vpc_id" {
  value = aws_vpc.cust_vpc.id
}

output "public_subnet_ids" {
  value = [
    aws_subnet.public_subnet_1.id,
    aws_subnet.public_subnet_2.id
  ]
}

output "private_subnet_ids" {
  value = [
    aws_subnet.private_subnet_1.id,
    aws_subnet.private_subnet_2.id,
    aws_subnet.private_subnet_3.id,
    aws_subnet.private_subnet_4.id,
    aws_subnet.private_subnet_5.id,
    aws_subnet.private_subnet_6.id
  ]
}

output "subnet_availability_zones" {
  value = [
    aws_subnet.public_subnet_1.availability_zone,
    aws_subnet.public_subnet_2.availability_zone,
    aws_subnet.private_subnet_3.availability_zone,
    aws_subnet.private_subnet_4.availability_zone,
    aws_subnet.private_subnet_5.availability_zone,
    aws_subnet.private_subnet_6.availability_zone,
    aws_subnet.private_subnet_1.availability_zone,
    aws_subnet.private_subnet_2.availability_zone
  ]
}