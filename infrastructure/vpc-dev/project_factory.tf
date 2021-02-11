module "project_factory" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 10.1"

  name              = "vpc-dev"
  random_project_id = true
  org_id            = var.org_id
  folder_id         = data.terraform_remote_state.resources_folders.outputs.devops_networking.dev
  billing_account   = var.billing_account

  enable_shared_vpc_host_project = true

  activate_apis = [
    "compute.googleapis.com",
    "container.googleapis.com",
  ]
}
