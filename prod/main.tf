# VPC
module "vpc" {
  source   = "../modules/vpc"   # עדכני לשם המדויק אם שונה
  vpc_cidr = var.vpc_cidr
}

# Security Groups
module "sg" {
  source = "../modules/sg"      # עדכני לשם המדויק אם שונה
  # דוגמה: תני למודול את ה-VPC id אם הוא צריך
  vpc_id = module.vpc.vpc_id    # רק אם המודול שלך אכן חושף output בשם הזה
}

# EC2
module "ec2" {
  source        = "../modules/ec2"  # עדכני לשם המדויק אם שונה
  key_name      = var.key_name
  instance_type = var.instance_type
  # דוגמה: תני subnet/sg מהמודולים הקודמים אם המודול ec2 צריך אותם
  # subnet_id     = module.vpc.public_subnet_ids[0]
  # security_group_ids = [ module.sg.web_sg_id ]
  depends_on = [module.vpc, module.sg]
}
