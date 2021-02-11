terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "fluidtruck"

    workspaces {
      name = "tfc-workspaces"
    }
  }
}
