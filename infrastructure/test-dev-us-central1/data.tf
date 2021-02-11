data "terraform_remote_state" "resources_folders" {
  backend = "remote"

  config = {
    organization = "fluidtruck"

    workspaces = {
      name = "resources-folders"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "fluidtruck"

    workspaces = {
      name = "vpc-dev"
    }
  }
}
