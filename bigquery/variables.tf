/**
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
################################################################################
# Basic Configs
################################################################################

variable "dataset_id" {
  description = "Unique ID for the dataset being provisioned."
  type        = string
}

variable "dataset_name" {
  description = "Friendly name for the dataset being provisioned."
  type        = string
}

variable "description" {
  description = "Dataset description."
  type        = string
}

variable "location" {
  description = "The regional location for the dataset only US and EU are allowed in module"
  type        = string
}

variable "delete_contents_on_destroy" {
  description = "(Optional) If set to true, delete all the tables in the dataset when destroying the resource; otherwise, destroying the resource will fail if tables are present."
  type        = bool
}

variable "default_table_expiration_ms" {
  description = "TTL of tables using the dataset in MS"
  type        = number
}

variable "project_id" {
  description = "Project where the dataset and table are created"
  type        = string
}

variable "encryption_key" {
  description = "Default encryption key to apply to the dataset. Defaults to null (Google-managed)."
  type        = string
}

variable "tags" {
  description = "Key value pairs in a map for dataset labels"
  type        = map(string)
}

# Format: list(objects)
# domain: A domain to grant access to.
# group_by_email: An email address of a Google Group to grant access to.
# user_by_email:  An email address of a user to grant access to.
# special_group: A special group to grant access to.
variable "access" {
  description = "An array of objects that define dataset access for one or more entities."
  type        = any
}

################################################################################
# Labels
################################################################################

variable "environment" {
  type        = string
  description = "Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT'" 
  default     = ""
}

variable "company" {
  type        = string
  description = "Company that owns resource"
  default     = ""
}

variable "costcenter" {
  type        = string
  description = "The project cost center"
  default     = ""
}

variable "owner-department" {
  type        = string
  description = "The name of department owner"
  default     = ""
}

variable "it-department" {
  type        = string
  description = "The name of IT department"
  default     = ""
}

variable "barometer-it-num" {
  type        = string
  description = "The barometer it number"
  default     = ""
}

variable "application" {
  type        = string
  description = " Based upon application nomenclature in server naming convention policy.Use up to six (6) characters to name your application."
  default     = ""
}

variable "resource-type" {
  type        = string
  description = "Type of resource."
  default     = ""
}

variable "layer" {
  type        = string
  description = " WEBx, MWx, DBx, UTILx"
  default     = ""
}

variable "compliance" {
  type        = string
  description = " PHI, PCI, PII, SOX, None"
  default     = ""
}

variable "application_dl" {
  type        = string
  description = " Application DL tag"
  default     = ""
}

variable "gcp_org_structure" {
  type        = string
  description = "gcp org structure for the resource"
  default     = ""
}

variable "region" {
  type        = string
  description = "region tag for the resource"
  default     = ""
}

variable "availability" {
  type        = string
  description = "availability schedule for the resource"
  default     = ""
}

variable "backup_retention" {
  type        = string
  description = "backup retention tag for the resource"
  default     = ""
}

variable "maintenance_window" {
  type        = string
  description = "maintenance window for the resource"
  default     = ""
}

variable "resource_creator" {
  type        = string
  description = "the creator of the resource (probably terraform)"
  default     = ""
}

variable "data_classification" {
  type        = string
  description = "classification of data for the resource"
  default     = ""
}

variable "patch_window" {
  type        = string
  description = "patch window for the resource"
  default     = ""
}

variable "app-business-owner" {
  type        = string
  description = "the business owner of the application that this reosurce is part of"
  default     = ""
}

variable "app-servicenow-group" {
  type        = string
  description = "the service now group of the applicaiton that this resource is a part of"
  default     = ""
}

variable "app-support-dl" {
  type        = string
  description = "the app support dl of the resource"
  default     = ""
}

variable "business-division" {
  type        = string
  description = "the business division the reosurce/application is a part of"
  default     = ""
}

variable "schedule-window" {
  type        = string
  description = "the schedule window of the resource"
  default     = ""
}
