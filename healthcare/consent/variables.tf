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


variable "healthcare_dataset_location" {
  type        = string
  description = "Healthcare Dataset Location"
}

variable "healthcare_dataset_name" {
  type        = string
  description = "Healthcare Dataset Name"
}

variable "healthcare_consent_store_name" {
  type        = string
  description = "Healthcare Consent Store Name"
}

variable "enable_consent_create_on_update" {
  type        = bool
  description = "Healthcare Consent Create on update"
}
variable "default_consent_ttl" {
  type        = string
  description = "Healthcare Consent TTL"
}
variable "labels" {
  type        = map(any)
  description = "Healthcare Labels"
}



#IAM


variable "google_iam_policy_role" {
  type        = string
  description = "Healthcare IAM Policy Role"
}

variable "google_iam_policy_members" {
  type        = list(any)
  description = "Google IAM Policy Members"
}

variable "google_healthcare_consent_store_iam_binding_role" {
  type        = string
  description = "Google healthcare consent store iam binding role"
}

variable "google_healthcare_consent_store_iam_binding_members" {
  type        = list(any)
  description = "Google healthcare consent store IAM binding members list"
}

variable "google_healthcare_consent_store_iam_member_role" {
  type        = string
  description = "Google healthcare consent store iam member role"
}

variable "google_healthcare_consent_store_iam_member" {
  type        = string
  description = "Google healthcare consent store IAM member"
}
