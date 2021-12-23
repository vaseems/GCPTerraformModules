output "google_healthcare_fhir_store_name" {
  description = "Name of the FHIR Store"
  value       = google_healthcare_fhir_store.default.name
}

output "google_healthcare_fhir_store_id" {
  description = "FHIR Store ID"
  value       = google_healthcare_fhir_store.default.id
}


output "google_healthcare_fhir_store_notification_configuration" {
  description = "FHIR Store Notification Configuraiton"
  value       = google_healthcare_fhir_store.default.notification_config
}

output "google_pubsub_topic_topic_name" {
  description = "Google PubSub Topic Name"
  value       = google_pubsub_topic.topic.name
}
