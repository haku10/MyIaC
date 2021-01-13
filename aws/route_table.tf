resource "aws_internet_gateway" "my-gateway" {
  vpc_id = aws_vpc.my-vpc1.id
  tags = {
    Name = "${var.stage}-my-gateway"
  }
}

resource "aws_route_table" "my-route-table" {
  vpc_id = aws_vpc.my-vpc1.id
  tags = {
    Name = "${var.stage}-my-route-table"
  }
}

resource "aws_route_table_association" "my-route-table-association" {
  route_table_id = aws_route_table.my-route-table.id
  subnet_id      = aws_subnet.my-subnet1-1.id
}

resource "aws_route" "my_route" {
  route_table_id         = aws_route_table.my-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my-gateway.id
  depends_on             = aws_route_table.my-route-table
}
