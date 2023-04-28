#creating aws VPC
resource "aws_vpc" "kontan" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "ktprofile"
  }
}

#public subnets
resource "aws_subnet" "kontan-pub-1" {
  vpc_id                  = aws_vpc.kontan.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "kontan-pub-1"
  }
}

resource "aws_subnet" "kontan-pub-2" {
  vpc_id                  = aws_vpc.kontan.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "kontan-pub-2"
  }
}

resource "aws_subnet" "kontan-pub-3" {
  vpc_id                  = aws_vpc.kontan.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3
  tags = {
    Name = "kontan-pub-3"
  }
}

#private subnets
resource "aws_subnet" "kontan-priv-1" {
  vpc_id                  = aws_vpc.kontan.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "kontan-priv-1"
  }
}

resource "aws_subnet" "kontan-priv-2" {
  vpc_id                  = aws_vpc.kontan.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "kontan-priv-2"
  }
}

resource "aws_subnet" "kontan-priv-3" {
  vpc_id                  = aws_vpc.kontan.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3
  tags = {
    Name = "kontan-priv-3"
  }
}

#internet gateway
resource "aws_internet_gateway" "kontan-IGW" {
  vpc_id = aws_vpc.kontan.id
  tags = {
    Name = "dove-IGW"
  }
}

#route-table
resource "aws_route_table" "kontan-pub-RT" {
  vpc_id = aws_vpc.kontan.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.kontan-IGW.id
  }

  tags = {
    Name = "kontan-pub-RT"
  }
}

#route-table association
resource "aws_route_table_association" "kontan-pub-1-a" {
  subnet_id      = aws_subnet.kontan-pub-1.id
  route_table_id = aws_route_table.kontan-pub-RT.id
}

resource "aws_route_table_association" "kontan-pub-2-a" {
  subnet_id      = aws_subnet.kontan-pub-2.id
  route_table_id = aws_route_table.kontan-pub-RT.id
}

resource "aws_route_table_association" "kontan-pub-3-a" {
  subnet_id      = aws_subnet.kontan-pub-3.id
  route_table_id = aws_route_table.kontan-pub-RT.id
}
