variable "project_id" {
  type        = string
  description = "Google Project ID"
}

variable "region" {
  type        = string
  description = "Google Region"
}

variable "zone" {
  type        = string
  description = "Google Zone"
}

variable "healthcare_fhir_store_name" {
  type        = string
  description = "Google Zone"
}
variable "healthcare_fhir_dataset_id" {
  type        = string
  description = "Google Zone"
}
variable "healthcare_fhir_version" {
  type        = string
  description = "Google Zone"
}

variable "enable_update_create" {
  type        = bool
  description = "Google Zone"
}
variable "disable_referential_integrity" {
  type        = bool
  description = "Google Zone"
}
variable "disable_resource_versioning" {
  type        = bool
  description = "Google Zone"
}
variable "enable_history_import" {
  type        = bool
  description = "Google Zone"
}

variable "labels" {
  type        = map(any)
  description = "Custom Labels"
}

variable "google_pubsub_topic_name" {
  type        = string
  description = "google_pubsub_topic_name"
}

variable "google_iam_policy_role" {
  type        = string
  description = "google_iam_policy_role"
}
variable "admin_members" {
  type        = list(any)
  description = "admin_members"
}

variable "google_healthcare_fhir_store_iam_binding_role" {
  type        = string
  description = "google_healthcare_fhir_store_iam_binding_role"
}
variable "members" {
  type        = list(any)
  description = "members"
}

variable "google_healthcare_fhir_store_iam_member_role" {
  type        = string
  description = "google_healthcare_fhir_store_iam_member_role"
}
variable "member" {
  type        = string
  description = "member"
}
