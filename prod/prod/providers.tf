terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws        = { source = "hashicorp/aws", version = "~> 5.0" }
    kubernetes = { source = "hashicorp/kubernetes", version = "~> 2.29" }
    helm       = { source = "hashicorp/helm",       version = "~> 2.13" }
  }
  # אם יש לך backend S3+DDB ל-state, שימי כאן
}

provider "aws" {
  region = var.region
}
