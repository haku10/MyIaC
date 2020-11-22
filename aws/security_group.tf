# security_group
resource "aws_security_group" "mysql" {
  name        = "${var.stage}-my-mysql"
  description = "${var.stage}-my-mysql"
  vpc_id      = aws_vpc.my-vpc1.id

  tags = {
    Name = "${var.stage}_mysql"
  }
}

resource "aws_security_group_rule" "mysql-ingress-ec2" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = aws_security_group.mysql.id
  source_security_group_id = aws_security_group.mysql.id
}

resource "aws_security_group" "alb" {
  name        = "${var.stage}-my-alb"
  description = "${var.stage}-test-alb"
  vpc_id      = aws_vpc.my-vpc1.id

  tags = {
    "Name" = "${var.stage}-my-alb"
  }
}

resource "aws_security_group_rule" "alb-ingress-https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.alb.id
}
