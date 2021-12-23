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

resource "google_healthcare_fhir_store" "default" {
  name    = var.healthcare_fhir_store_name
  dataset = var.healthcare_fhir_dataset_id
  version = var.healthcare_fhir_version

  enable_update_create          = var.enable_update_create
  disable_referential_integrity = var.disable_referential_integrity
  disable_resource_versioning   = var.disable_resource_versioning
  enable_history_import         = var.enable_history_import

  notification_config {
    pubsub_topic = google_pubsub_topic.topic.id
  }

  labels = var.labels
}

resource "google_pubsub_topic" "topic" {
  name = var.google_pubsub_topic_name
}

#IAM

data "google_iam_policy" "admin" {
  binding {
    role = var.google_iam_policy_role #"roles/editor"

    members = var.admin_members #[ "user:jane@example.com", ]
  }
}

resource "google_healthcare_fhir_store_iam_policy" "fhir_store" {
  fhir_store_id = google_healthcare_fhir_store.default.id
  policy_data   = data.google_iam_policy.admin.policy_data
}

resource "google_healthcare_fhir_store_iam_binding" "fhir_store" {
  fhir_store_id = google_healthcare_fhir_store.default.id
  role          = var.google_healthcare_fhir_store_iam_binding_role

  members = var.members #[ "user:jane@example.com", ]
}

resource "google_healthcare_fhir_store_iam_member" "fhir_store" {
  fhir_store_id = google_healthcare_fhir_store.default.id
  role          = var.google_healthcare_fhir_store_iam_member_role #"roles/editor"
  member        = var.member
}
