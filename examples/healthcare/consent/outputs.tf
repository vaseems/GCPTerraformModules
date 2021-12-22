
output "healthcare_name" {
  value = module.healthcare.google_healthcare_dataset_name
}
output "healthcare_consent_store_name" {
  value = module.healthcare.google_healthcare_consent_store_name
}


output "healthcare_id" {
  value = module.healthcare.google_healthcare_dataset_id
}
output "healthcare_consent_store_id" {
  value = module.healthcare.google_healthcare_consent_store_id
}

output "google_healthcare_consent_store_iam_policy_data" {
  value = module.healthcare.google_healthcare_consent_store_iam_policy_data
}
