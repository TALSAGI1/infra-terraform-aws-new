provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "tfstate" {
  bucket = var.bucket_name

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = true
  }

  tags = {
    Name      = var.bucket_name
    ManagedBy = "terraform-bootstrap"
  }
}

resource "aws_dynamodb_table" "lock" {
  name         = var.dynamodb_table
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    ManagedBy = "terraform-bootstrap"
  }
}
