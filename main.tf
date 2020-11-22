resource "aws_instance" "myInstance1" {
  ami           = var.ami_id
  instance_type = var.aws_instance_type
  subnet_id = aws_subnet.subnet1.id
  tags = {
    Name = var.aws_instance_tag_name
  }
}
