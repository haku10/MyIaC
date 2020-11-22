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
  default = "ami-086ca990ae371235f"
}
