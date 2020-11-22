resource "aws_instance" "my_instance1" {
  ami           = var.ami_id
  instance_type = var.aws_instance_type
  subnet_id = aws_subnet.my_subnet1_1.id
  tags = {
    Name = var.aws_instance_tag_name
  }
}
