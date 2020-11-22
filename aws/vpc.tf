# VPC
resource "aws_vpc" "my-vpc1" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "false"
}

# subnet1
resource "aws_subnet" "my-subnet1-1" {
    vpc_id = aws_vpc.my-vpc1.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-northeast-1a"

  tags = {
    Name = "my-subnet1-1"
  }
}

# subnet2
resource "aws_subnet" "my-subnet1-2" {
    vpc_id = aws_vpc.my-vpc1.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-northeast-1c"

  tags = {
    Name = "my-subnet1-2"
  }
}

# subnet3
resource "aws_subnet" "my-subnet1-3" {
    vpc_id = aws_vpc.my-vpc1.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "ap-northeast-1d"

  tags = {
    Name = "my-subnet1-3"
  }
}

# network_acl
resource "aws_network_acl" "my-network-acl" {
  vpc_id = aws_vpc.my-vpc1.id
  subnet_ids  = ["${aws_subnet.my-subnet1-1.id}", "${aws_subnet.my-subnet1-2.id}", "${aws_subnet.my-subnet1-3.id}"]
  
  ingress {
  protocol   = "all"
  rule_no    = 100
  action     = "allow"
  cidr_block = "0.0.0.0/0"
  from_port  = 0
  to_port    = 0
  }

  egress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "my-network-acl"
  }
}
