module "infra" {
  source         = "../modules/infra"   # עדכני אם המודול במקום אחר
  vpc_cidr       = var.vpc_cidr
  public_subnets = var.public_subnets
  instance_type  = var.instance_type
  key_name       = var.key_name
}
