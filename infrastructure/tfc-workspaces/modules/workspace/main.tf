provider "tfe" {
  hostname = "app.terraform.io"
}

resource "tfe_workspace" "workspace" {
  name              = var.name
  organization      = "fluidtruck"
  working_directory = "/${var.name}"
  trigger_prefixes  = var.trigger_prefixes

  vcs_repo {
    identifier     = "fluidshare/infrastructure"
    branch         = "main"
    oauth_token_id = "ot-Gx1FEenkugDdGyMA"
  }

  # lifecycle {
  #   prevent_destroy = true
  # }
}

resource "tfe_variable" "google_credentials" {
  count        = var.google_credentials == "" ? 0 : 1
  key          = "GOOGLE_CREDENTIALS"
  value        = var.google_credentials
  category     = "env"
  sensitive    = true
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_variable" "org_id" {
  count        = var.org_id == "" ? 0 : 1
  key          = "org_id"
  value        = var.org_id
  category     = "terraform"
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_variable" "billing_account" {
  count        = var.billing_account == "" ? 0 : 1
  key          = "billing_account"
  value        = var.billing_account
  category     = "terraform"
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_notification_configuration" "slack" {
  name             = "slack"
  enabled          = true
  destination_type = "slack"
  triggers         = ["run:needs_attention", "run:applying", "run:completed", "run:errored"]
  url              = "https://hooks.slack.com/services/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"
  workspace_id     = tfe_workspace.workspace.id
}
