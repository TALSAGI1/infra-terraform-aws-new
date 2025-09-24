variable "region"         { type = string }
variable "bucket_name"    { type = string }   # ייחודי גלובלית, למשל my-tfstate-<name>-prod-2025
variable "dynamodb_table" { type = string }   # למשל tf-locks-<name>-prod