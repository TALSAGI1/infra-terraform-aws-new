variable "region" {
  type = string
}

# ייחודי גלובלית, למשל: my-tfstate-<name>-prod-2025
variable "bucket_name" {
  type = string
}

# למשל: tf-locks-<name>-prod
variable "dynamodb_table" {
  type = string
}
