module "resources_folders" {
  source = "./modules/workspace"

  name               = "resources-folders"
  google_credentials = var.google_credentials
  org_id             = var.org_id
  billing_account    = var.billing_account
}

module "test_dev_us_central1" {
  source = "./modules/workspace"

  name               = "test-dev-us-central1"
  google_credentials = var.google_credentials
  org_id             = var.org_id
  billing_account    = var.billing_account
}

module "vpc_dev" {
  source = "./modules/workspace"

  name               = "vpc-dev"
  google_credentials = var.google_credentials
  org_id             = var.org_id
  billing_account    = var.billing_account
}
