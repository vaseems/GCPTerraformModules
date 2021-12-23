module "healthcare_dataset" {
  source = "./healthcare-gcp/consent-store"

  project_id = "composer-evaluation"
  zone       = "us-central1-c"
  region     = "us-central1"

  healthcare_dataset_location     = "us-central1"
  healthcare_dataset_name         = "mydataset"
  healthcare_consent_store_name   = "mystore"
  enable_consent_create_on_update = true
  default_consent_ttl             = "90000s"
  labels = {
    "label1" : "label1"
  }

  google_iam_policy_role    = "roles/viewer"
  google_iam_policy_members = ["user:vaseemabbas.mohammed@gmail.com", ]

  google_healthcare_consent_store_iam_binding_role    = "roles/viewer"
  google_healthcare_consent_store_iam_binding_members = ["user:vaseemabbas.mohammed@gmail.com", ]
  google_healthcare_consent_store_iam_member_role     = "roles/viewer"
  google_healthcare_consent_store_iam_member          = "user:vaseemabbas.mohammed@gmail.com"
}

module "healthcare_fhir" {
  source = "./healthcare-gcp/fhir"

  project_id = "composer-evaluation"
  zone       = "us-central1-c"
  region     = "us-central1"

  healthcare_fhir_store_name = "first_fhir_store"
  healthcare_fhir_dataset_id = module.healthcare_dataset.google_healthcare_dataset_id
  healthcare_fhir_version    = "R4"

  enable_update_create          = false
  disable_referential_integrity = false
  disable_resource_versioning   = false
  enable_history_import         = false

  google_pubsub_topic_name = "fhir_topic"

  google_iam_policy_role = "roles/editor"
  admin_members          = ["user:vaseemabbas.mohammed@gmail.com", ]

  labels = {
    "label1" : "label1"
  }

  google_healthcare_fhir_store_iam_binding_role = "roles/editor"
  members                                       = ["user:vaseemabbas.mohammed@gmail.com"]

  google_healthcare_fhir_store_iam_member_role = "roles/editor"
  member                                       = "user:vaseemabbas.mohammed@gmail.com"
}
