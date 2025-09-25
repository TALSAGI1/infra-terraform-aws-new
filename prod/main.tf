# --- VPC ---
module "vpc" {
  source         = "../modules/vpc"      # עדכני אם שם התיקייה שונה
  cidr           = var.vpc_cidr
  name           = "prod-vpc"            # תגית/שם כללי; אפשר גם להפוך ל-var עם default
  public_subnets = var.public_subnets
  azs            = var.azs
}

# --- SG ---
module "sg" {
  source        = "../modules/sg"
  vpc_id        = module.vpc.vpc_id      # מגיע מה-output של vpc
  name          = "prod-sg"              # תגית; לא ID
  allowed_ports = var.allowed_ports
}

# --- AMI דינמית (Amazon Linux 2023, x86_64) ---
data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]
  filter { name = "name"     
values = ["al2023-ami-*-x86_64"] 
}
  filter { name = "architecture"
values = ["x86_64"] 
}
}

# --- EC2 ---
module "ec2" {
  source        = "../modules/ec2"
  name          = var.name
  ami           = data.aws_ami.al2023.id
  instance_type = var.instance_type

  # אם ה-VPC מחזיר רשימה של סאבנטים ציבוריים:
  subnet_id = module.vpc.public_subnet_ids[0]
  # ואם בחרת output יחיד public_subnet_id – השתמשי בו במקום:
  # subnet_id = module.vpc.public_subnet_id

  sg_id = module.sg.sg_id

  depends_on = [module.vpc, module.sg]
}
