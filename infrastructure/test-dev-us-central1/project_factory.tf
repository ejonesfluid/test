module "project_factory" {
  source  = "terraform-google-modules/project-factory/google//modules/svpc_service_project"
  version = "~> 10.1"

  name              = "test-dev-us-central1"
  random_project_id = true
  org_id            = var.org_id
  folder_id         = local.folder_id
  billing_account   = var.billing_account

  shared_vpc = local.network_project
  shared_vpc_subnets = [
    "projects/${local.network_project}/regions/us-central1/subnetworks/vpc-02-us-central1-01",
    "projects/${local.network_project}/regions/us-central1/subnetworks/vpc-02-us-central1-02"
  ]
  grant_services_security_admin_role = true

  activate_apis = [
    "compute.googleapis.com",
    "container.googleapis.com",
  ]
}
