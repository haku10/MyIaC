# Create a VPC
resource "aws_vpc" "myVPC" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "false"
}

# Create a subnet
resource "aws_subnet" "subnet1" {
    vpc_id = aws_vpc.myVPC.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-northeast-1a"

  tags = {
    Name = "sample-subnet1"
  }
}
