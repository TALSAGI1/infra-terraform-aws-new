variable "region"         {
type = string 
default = "eu-west-1" 
}

# רשת – ברירת־מחדל סבירה
variable "vpc_cidr"       {
type = string     
default = "10.0.0.0/16"
}
variable "public_subnets" { 
type = list(string)  
default = ["10.0.1.0/24","10.0.2.0/24"]
}
variable "azs"            { 
type = list(string)
default = ["eu-west-1a","eu-west-1b"] 
}

# EC2 – ברירות־מחדל
variable "instance_type"  { 
type = string      
default = "t3.micro"
}
variable "name"           {
type = string     
default = "prod-ec2" 
}

# פתיחת פורטים ב-SG (אם המודול SG צריך רשימה)
variable "allowed_ports"  { 
type = list(number)
default = [22, 80, 443]
}
