provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_vpc" "vpc1" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = "true"
  tags = {
    Name = "sydney_vpc"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-southeast-2a"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "sydney-subnet1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-southeast-2b"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "sydney-subnet2"
  }
}

resource "aws_internet_gateway" "igw1" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    Name = "sydney-IGW"
  }
}
resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw1.id
  }

  tags = {
    Name = "sydney-RT"
  }
}

resource "aws_route_table_association" "ass1" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.rt1.id
}

resource "aws_route_table_association" "ass2" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.rt1.id
}
