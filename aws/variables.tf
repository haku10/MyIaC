# 変数設定のファイル
variable "stage" {
  default = "test"
}

variable aws_instance_type {
  type        = string
  description = "AWSインスタンス種別"
  default     = "t2.micro"
}

variable aws_instance_tag_name {
  type        = string
  description = "AWSインスタンスタグ：Name"
  default     = "my_instance1"
}

variable "ami_id" {
  default = "ami-0ede32f8db20757b3"
}

variable "aws_db_username" {
  default = "root"
}

variable "aws_db_password" {
  default = "test1234"
}
