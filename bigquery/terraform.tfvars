/***
Datasets allow you to organize and control access to your tables.
***/


################################################################################
# Basic Configs
################################################################################
dataset_id     = "joshs_fake_dataset_416" //Unique ID for the dataset being provisioned
dataset_name   = "fake_name" //Friendly name for the dataset being provisioned.
project_id     = "sbx-csbd-poc88a" //Project where the dataset and table are created
description    = "fake description" //Dataset description
#encryption_key = "projects/sbx-csbd-poc88a/locations/us/keyRings/bq-test-key-ring-us/cryptoKeys/bq2"
encryption_key = "antm-default-bq" //Default encryption key to apply to the dataset. Defaults to null (Google-managed).
location = "us-central1" //The regional location for the dataset only US and EU are allowed in module

access = [{   //"An array of objects that define dataset access for one or more entities.
    role          = "roles/bigquery.dataOwner"
    special_group = "projectOwners"
  },
  {
    role          = "roles/bigquery.dataOwner"
    user_by_email = "joshua-vayle@anthem.com" 
  }]

default_table_expiration_ms = null //TTL of tables using the dataset in MS
delete_contents_on_destroy =  null //(Optional) If set to true, delete all the tables in the dataset when destroying the resource; otherwise, destroying the resource will fail if tables are present.
tags = {} //Key value pairs in a map for dataset labels


################################################################################
# Labels
################################################################################
# environment          = //environment for the resource: DBx,SIT,PERF,PRODX,UAT,UTILx
# company              = //Based upon company that owns resource e.g.ANTM–Anthem
# costcenter           = //The project cost center
# owner-department     = //The name of department owner
# it-department        = //The name of IT department
# barometer-it-num     = //arometer it number
# application          = //Based upon application nomenclature in server naming convention policy.Use up to six (6) characters to name your application.
# resource-type        = //the type of resource.
# layer                = //WEBx, MWx, DBx, UTILx
# compliance           = //PHI, PCI, PII, SOX, None
# application_dl       = //Application dl for the resource

# gcp_org_structure    = // gcp org structure for the project of the resource
# region               = //region tag for the resource 
# availability         = //availability schedule for the resource
# backup_retention     = //backup retention tag for the resource
# maintenance_window   = //maintenance window for the resource
# resource_creator     = //the creator of the resource (probably terraform)
# data_classification  = //classification of data for the resource
# patch_window         = //patch window for the resource
# app-business-owner   = //the business owner of the application that this reosurce is part of
# app-servicenow-group = //the service now group of the applicaiton that this resource is a part of
# app-support-dl       = //the app support dl of the resource
# business-division    = //the business division the reosurce/application is a part of
# schedule-window      = //the schedule window of the resource