module "root" {
  source  = "terraform-google-modules/folders/google"
  version = "~> 2.0"

  names = [
    "devops"
  ]

  parent = "organizations/${var.org_id}"
}

module "devops" {
  source  = "terraform-google-modules/folders/google"
  version = "~> 2.0"

  names = [
    "applications",
    "networking"
  ]

  parent = module.root.ids.devops
}

module "devops_applications" {
  source  = "terraform-google-modules/folders/google"
  version = "~> 2.0"

  names = [
    "dev",
    "stage",
    "prod",
  ]

  parent = module.devops.ids.applications
}

module "devops_networking" {
  source  = "terraform-google-modules/folders/google"
  version = "~> 2.0"

  names = [
    "dev",
    "stage",
    "prod",
  ]

  parent = module.devops.ids.networking
}
