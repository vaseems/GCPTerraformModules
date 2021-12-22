locals {
  # tables          = { for table in var.tables : table["table_id"] => table }
  # views           = { for view in var.views : view["view_id"] => view }
  # external_tables = { for external_table in var.external_tables : external_table["table_id"] => external_table }

  iam_to_primitive = {
    "roles/bigquery.dataOwner" : "OWNER"
    "roles/bigquery.dataEditor" : "WRITER"
    "roles/bigquery.dataViewer" : "READER"
  
  }
}

  terraform {
    required_providers {
      google = {
        source = "hashicorp/google"
        version = "3.60.0"
      }
    }
  }

  provider "google" {
  }

resource "google_bigquery_dataset" "main" {
  dataset_id                  = var.dataset_id
  friendly_name               = var.dataset_name
  description                 = var.description
  location                    = var.location
  delete_contents_on_destroy  = var.delete_contents_on_destroy
  default_table_expiration_ms = var.default_table_expiration_ms
  project                     = var.project_id
  labels                      = merge ({  
    environment      = var.environment
    company          = var.company
    costcenter       = var.costcenter
    owner-department = var.owner-department
    it-department    = var.it-department
    barometer-it-num = var.barometer-it-num
    application      = var.application
    resource-type    = var.resource-type
    layer            = var.layer
    compliance       = var.compliance
    application_dl   = var.application_dl

    gcp_org_structure    = var.gcp_org_structure
    region               = var.region
    availability         = var.availability
    backup_retention     = var.backup_retention
    maintenance_window   = var.maintenance_window
    resource_creator     = var.resource_creator
    data_classification  = var.data_classification
    patch_window         = var.patch_window
    app-business-owner   = var.app-business-owner
    app-servicenow-group = var.app-servicenow-group
    app-support-dl       = var.app-support-dl
    business-division    = var.business-division
    schedule-window      = var.schedule-window
    }, var.tags)

  # dynamic "default_encryption_configuration" {
  #   for_each = var.encryption_key == null ? [] : [var.encryption_key]
  #   content {
  #     kms_key_name = var.encryption_key
  #     #location     = var.location
  #   }
  # }
  default_encryption_configuration{
    kms_key_name =  data.google_kms_crypto_key.my_crypto_key.self_link
  }
  # dynamic "default_encryption_configuration" {
  #   for_each = data.google_kms_crypto_key.my_crypto_key == null ? [] : [var.google_kms_crypto_key.my_crypto_key]
  #   content {
  #     kms_key_name = data.google_kms_crypto_key.my_crypto_key.name
  #     #location     = var.location
  #   }
  # }

  dynamic "access" {
    for_each = var.access
    content {
      # BigQuery API converts IAM to primitive roles in its backend.
      # This causes Terraform to show a diff on every plan that uses IAM equivalent roles.
      # Thus, do the conversion between IAM to primitive role here to prevent the diff.
      role = lookup(local.iam_to_primitive, access.value.role, access.value.role)

      domain         = lookup(access.value, "domain", null)
      group_by_email = lookup(access.value, "group_by_email", null)
      user_by_email  = lookup(access.value, "user_by_email", null)
      special_group  = lookup(access.value, "special_group", null)
    }
  }

  depends_on = [google_kms_crypto_key_iam_member.new_crypto_key_member]
}

data "google_project" "default" {
  project_id = var.project_id
}

data "google_kms_key_ring" "my_key_ring" {
  name     = "antm-default-keyring-${var.location}"
  location = var.location
  project  = var.project_id
}

data "google_kms_crypto_key" "my_crypto_key" {
  name     = var.encryption_key
  key_ring = data.google_kms_key_ring.my_key_ring.self_link
}

resource "google_kms_crypto_key_iam_member" "new_crypto_key_member" {
  crypto_key_id =  data.google_kms_crypto_key.my_crypto_key.id   #"${var.project_id}/${var.location}/${data.google_kms_key_ring.my_key_ring.name}/${data.google_kms_crypto_key.my_crypto_key.name}" #"${var.location}/${data.google_kms_key_ring.my_key_ring.name}/${data.google_kms_crypto_key.my_crypto_key.id}"
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:bq-${data.google_project.default.number}@bigquery-encryption.iam.gserviceaccount.com"
}