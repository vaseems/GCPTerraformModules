terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region #"us-central1"
  zone    = var.zone   #"us-central1-c"
}

resource "google_healthcare_dataset" "dataset" {
  location = var.healthcare_dataset_location
  name     = var.healthcare_dataset_name
}

resource "google_healthcare_consent_store" "my-consent" {
  dataset = google_healthcare_dataset.dataset.id
  name    = var.healthcare_consent_store_name

  enable_consent_create_on_update = var.enable_consent_create_on_update
  default_consent_ttl             = var.default_consent_ttl #"90000s"

  labels = var.labels
}

#IAM

data "google_iam_policy" "admin" {
  binding {
    role    = var.google_iam_policy_role    #"roles/viewer"
    members = var.google_iam_policy_members #["user:jane@example.com",]
  }
}

resource "google_healthcare_consent_store_iam_policy" "policy" {
  dataset          = google_healthcare_consent_store.my-consent.dataset
  consent_store_id = google_healthcare_consent_store.my-consent.name
  policy_data      = data.google_iam_policy.admin.policy_data
}


resource "google_healthcare_consent_store_iam_binding" "binding" {
  dataset          = google_healthcare_consent_store.my-consent.dataset
  consent_store_id = google_healthcare_consent_store.my-consent.name
  role             = var.google_healthcare_consent_store_iam_binding_role #"roles/viewer"
  members          = var.google_healthcare_consent_store_iam_binding_members
}

resource "google_healthcare_consent_store_iam_member" "member" {
  dataset          = google_healthcare_consent_store.my-consent.dataset
  consent_store_id = google_healthcare_consent_store.my-consent.name
  role             = var.google_healthcare_consent_store_iam_member_role #"roles/viewer"
  member           = var.google_healthcare_consent_store_iam_member
}

