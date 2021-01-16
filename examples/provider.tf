provider "aws" {
  profile             = var.aws_profile
  region              = var.region
  allowed_account_ids = var.account_id
}
