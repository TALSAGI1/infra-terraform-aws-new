variable "ami" { type = string }  # ID של מערכת ההפעלה
variable "instance_type" { default = "t3.micro" }
variable "subnet_id" { type = string }
variable "sg_id" { type = string }
variable "name" { type = string }
