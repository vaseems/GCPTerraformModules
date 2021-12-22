output "dataset_id" {
  value = google_bigquery_dataset.main.dataset_id
}

output "friendly_name" {
  value = google_bigquery_dataset.main.friendly_name
}

output "description" {
  value = google_bigquery_dataset.main.description
}

output "location" {
  value = google_bigquery_dataset.main.location
}

output "project" {
  value = google_bigquery_dataset.main.project
}

output "id" {
  value = google_bigquery_dataset.main.id
}

output "creation_time" {
  value = google_bigquery_dataset.main.creation_time
}

output "etag" {
  value = google_bigquery_dataset.main.etag
}

output "last_modified_time" {
  value = google_bigquery_dataset.main.last_modified_time
}

output "self_link" {
  value = google_bigquery_dataset.main.self_link
}

output "delete_contents_on_destroy" {
  value = google_bigquery_dataset.main.delete_contents_on_destroy
}

output "default_table_expiration_ms" {
  value = google_bigquery_dataset.main.default_table_expiration_ms
}

output "kms_key" {
  value = google_bigquery_dataset.main.default_encryption_configuration[0]
}
