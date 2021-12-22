## Introduction

Configuration in this directory deploys a BigQuery dataset only and not any tables or views, those are handled in the application deployment pipements.

The basic required variables are access, dataset_id, dataset_name, default_table_expiration_ms, delete_contents_on_destroy, description, encryption_key, location, project_id, and tags. Other variables may be required based on the specific configuration (i.e. dependency on another variable).

## How to Run
To run the code, first make the necessary changes in the terraform.tfvars file. Many of the values are optional, but explicitly assigning values will ensure an accurate deployment.

After all necessary changes have been made, run the following commands on the Terminal / Command Prompt:

    terraform init
    terraform apply

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access | An array of objects that define dataset access for one or more entities. | `any` | n/a | yes |
| app-business-owner | the business owner of the application that this reosurce is part of | `string` | `""` | no |
| app-servicenow-group | the service now group of the applicaiton that this resource is a part of | `string` | `""` | no |
| app-support-dl | the app support dl of the resource | `string` | `""` | no |
| application | Based upon application nomenclature in server naming convention policy.Use up to six (6) characters to name your application. | `string` | `""` | no |
| application\_dl | Application DL tag | `string` | `""` | no |
| availability | availability schedule for the resource | `string` | `""` | no |
| backup\_retention | backup retention tag for the resource | `string` | `""` | no |
| barometer-it-num | The barometer it number | `string` | `""` | no |
| business-division | the business division the reosurce/application is a part of | `string` | `""` | no |
| company | Company that owns resource | `string` | `""` | no |
| compliance | PHI, PCI, PII, SOX, None | `string` | `""` | no |
| costcenter | The project cost center | `string` | `""` | no |
| data\_classification | classification of data for the resource | `string` | `""` | no |
| dataset\_id | Unique ID for the dataset being provisioned. | `string` | n/a | yes |
| dataset\_name | Friendly name for the dataset being provisioned. | `string` | n/a | yes |
| default\_table\_expiration\_ms | TTL of tables using the dataset in MS | `number` | n/a | yes |
| delete\_contents\_on\_destroy | (Optional) If set to true, delete all the tables in the dataset when destroying the resource; otherwise, destroying the resource will fail if tables are present. | `bool` | n/a | yes |
| description | Dataset description. | `string` | n/a | yes |
| encryption\_key | Default encryption key to apply to the dataset. Defaults to null (Google-managed). | `string` | n/a | yes |
| environment | Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT' | `string` | `""` | no |
| gcp\_org\_structure | gcp org structure for the resource | `string` | `""` | no |
| it-department | The name of IT department | `string` | `""` | no |
| layer | WEBx, MWx, DBx, UTILx | `string` | `""` | no |
| location | The regional location for the dataset only US and EU are allowed in module | `string` | n/a | yes |
| maintenance\_window | maintenance window for the resource | `string` | `""` | no |
| owner-department | The name of department owner | `string` | `""` | no |
| patch\_window | patch window for the resource | `string` | `""` | no |
| project\_id | Project where the dataset and table are created | `string` | n/a | yes |
| region | region tag for the resource | `string` | `""` | no |
| resource-type | Type of resource. | `string` | `""` | no |
| resource\_creator | the creator of the resource (probably terraform) | `string` | `""` | no |
| schedule-window | the schedule window of the resource | `string` | `""` | no |
| tags | Key value pairs in a map for dataset labels | `map(string)` | n/a | yes |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
