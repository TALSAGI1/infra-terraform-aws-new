terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
  backend "s3" {}  # ה-workflow מזריק פרטי backend ב-init
}
provider "aws" { region = var.region }
