locals {
  folder_id       = data.terraform_remote_state.resources_folders.outputs.devops_applications.dev
  network_project = data.terraform_remote_state.vpc.outputs.project_id
}
