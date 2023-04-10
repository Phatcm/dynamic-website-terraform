# create vpc
# terraform aws create vpc
resource "aws_vpc" "vpc" {
  cidr_block              = var.vpc_cidr
  instance_tenancy        = "default"
  enable_dns_hostnames    = true

  tags      = {
    Name    = "dev vpc"
  }
}

# create internet gateway and attach it to vpc
# terraform aws create internet gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id    = aws_vpc.vpc.id

  tags      = {
    Name    = "dev internet gateway"
  }
}

# create public subnet az1
resource "aws_subnet" "public_subnet_az1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_az1_cidr
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags      = {
    Name    = "public subnet az1"
  }
}

# create public subnet az2
resource "aws_subnet" "public_subnet_az2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_az2_cidr
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags      = {
    Name    = "public subnet az2"
  }
}

# create public subnet az3
resource "aws_subnet" "public_subnet_az3" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_az3_cidr
  availability_zone       = "ap-northeast-1d"
  map_public_ip_on_launch = true

  tags      = {
    Name    = "public subnet az3"
  }
}

# create route table and add public route
resource "aws_route_table" "public_route_table" {
  vpc_id       = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags       = {
    Name     = "public route table"
  }
}

# associate public subnet az1 to "public route table"
resource "aws_route_table_association" "public_subnet_az1_route_table_association" {
  subnet_id           = aws_subnet.public_subnet_az1.id
  route_table_id      = aws_route_table.public_route_table.id
}

# associate public subnet az2 to "public route table"
resource "aws_route_table_association" "public_subnet_2_route_table_association" {
  subnet_id           = aws_subnet.public_subnet_az2.id
  route_table_id      = aws_route_table.public_route_table.id
}

# associate public subnet az3 to "public route table"
resource "aws_route_table_association" "public_subnet_3_route_table_association" {
  subnet_id           = aws_subnet.public_subnet_az3.id
  route_table_id      = aws_route_table.public_route_table.id
}

# create private subnet az1
resource "aws_subnet" "private_app_subnet_az1" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = var.private_subnet_az1_cidr
  availability_zone        = "ap-northeast-1a"
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "private app subnet az1"
  }
}

# create private subnet az2
resource "aws_subnet" "private_app_subnet_az2" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = var.private_subnet_az2_cidr
  availability_zone        = "ap-northeast-1c"
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "private subnet az2"
  }
}

# create private subnet az3
resource "aws_subnet" "private_data_subnet_az1" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = var.private_subnet_az3_cidr
  availability_zone        = "ap-northeast-1d"
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "private subnet az3"
  }
}