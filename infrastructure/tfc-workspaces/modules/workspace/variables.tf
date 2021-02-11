variable "name" {
  description = "The name of the workspace."
  type        = string
}

variable "trigger_prefixes" {
  description = "The root level prefixes to trigger a run."
  type        = list(string)
  default     = []
}

variable "google_credentials" {
  description = "The GOOGLE_CREDENTIALS JSON for our Master Service Account."
  type        = string
  default     = ""
}

variable "org_id" {
  description = "The GCP organization ID."
  type        = string
  default     = ""
}

variable "billing_account" {
  description = "The GCP billing account ID."
  type        = string
  default     = ""
}
