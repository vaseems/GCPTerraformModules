module "healthcare" {
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

