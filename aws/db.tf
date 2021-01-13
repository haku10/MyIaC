# subnet_group
resource "aws_db_subnet_group" "test-db-subnet" {
    name        = "test-db"
    subnet_ids  = ["${aws_subnet.my-subnet1-1.id}", "${aws_subnet.my-subnet1-2.id}", "${aws_subnet.my-subnet1-3.id}"]
    tags = {
        Name = "test-db"
    }
}

# RDS instance
resource "aws_db_instance" "test-db" {
  identifier           = "test-db"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0.20"
  instance_class       = "db.t2.micro"
  name                 = "testdb"
  username             = "test"
  password             = "test"
  vpc_security_group_ids  = [aws_security_group.mysql.id]
  db_subnet_group_name = aws_db_subnet_group.test-db-subnet.name
  skip_final_snapshot = true
}

# parameter_group
resource "aws_db_parameter_group" "mysql" {
  name        = "test-${var.stage}-mysql"
  family      = "aurora-mysql5.7"
  description = "test-${var.stage}-mysql"

  parameter {
    name         = "innodb_lock_wait_timeout"
    value        = "5"
    apply_method = "immediate"
  }

  parameter {
    name         = "long_query_time"
    value        = "0.5"
    apply_method = "immediate"
  }

  parameter {
    name         = "log_bin_trust_function_creators"
    value        = "1"
    apply_method = "immediate"
  }

  parameter {
    name         = "query_cache_size"
    value        = "0"
    apply_method = "immediate"
  }

  parameter {
    name         = "query_cache_type"
    value        = "0"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "slow_query_log"
    value        = "1"
    apply_method = "immediate"
  }
}
