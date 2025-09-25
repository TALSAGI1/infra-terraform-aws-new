variable "region"            { 
    type = string 
     default = "eu-west-1"
     }
variable "vpc_cidr"          {
     type = string 
      default = "10.0.0.0/16"
       }
variable "public_subnets"    { 
    type = list(string) 
    default = ["10.0.1.0/24","10.0.2.0/24"] 
    }
variable "azs"               {
     type = list(string)
      default = ["eu-west-1a","eu-west-1b"] 
      }
variable "my_ip_cidr"        { 
    type = string 
    }           # למשל "1.2.3.4/32"
variable "ssh_public_key_path" {
     type = string
      }         # למשל "C:/Users/you/.ssh/id_ed25519.pub"
