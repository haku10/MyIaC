resource "aws_internet_gateway" "my_gateway" {
  vpc_id = aws_vpc.my_vpc1.id
  tags = {
    Name = "my-${var.stage}"
  }
}

resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc1.id
  tags = {
    Name = "my-${var.stage}"
  }
}

resource "aws_route_table_association" "my_route_table_association" {
  route_table_id = aws_route_table.my_route_table.id
  subnet_id      = aws_subnet.my_subnet1_1.id
}

resource "aws_route" "my_route" {
  route_table_id         = aws_route_table.my_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_gateway.id
  depends_on             = [aws_route_table.my_route_table]
}
