variable "google_credentials" {
  description = "The GOOGLE_CREDENTIALS JSON for our Master Service Account."
  type        = string
}

variable "org_id" {
  description = "The GCP organization ID."
  type        = string
}

variable "billing_account" {
  description = "The GCP billing account ID."
  type        = string
}
