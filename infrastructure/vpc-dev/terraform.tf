terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "fluidtruck"

    workspaces {
      name = "vpc-dev"
    }
  }
}
