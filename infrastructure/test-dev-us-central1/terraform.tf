terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "fluidtruck"

    workspaces {
      name = "test-dev-us-central1"
    }
  }
}
