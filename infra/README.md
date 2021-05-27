# terraform-k8s/infra
Example Intersight Infrastructure (Server Profiles) configuration for use in Terraform Cloud for Business.

For a step-by-step overview of setting up the Intersight Service for Terraform and configuring Terraform Cloud Workspaces, please see https://cdn.intersight.com/components/an-hulk/1.0.9-749/docs/cloud/data/resources/terraform-service/en/Cisco_IST_Getting_Started_Guide.pdf

## Usage
* Fork this repository into your own GitHub account
* Create a workspace in Terraform Cloud (https://www.terraform.io/docs/cloud/workspaces/index.html)
* Select your version control workflow
* Select your GitHub account and choose your forked repository
* Go to General Settings and change the execution mode to Remote
* Go to Variables and add any needed variables as specified below

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_intersight"></a> [intersight](#requirement\_intersight) | >= 1.0.2 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_imm_profile"></a> [imm\_profile](#module\_imm\_profile) | terraform-cisco-modules/server-profile/intersight |  |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apikey"></a> [apikey](#input\_apikey) | Public API Key ID | `string` | n/a | yes |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | URI used to access the Intersight API | `string` | `"https://www.intersight.com"` | no |
| <a name="input_secretkey"></a> [secretkey](#input\_secretkey) | Filename (absolute path) or string of PEM formatted private key data to be used for Intersight API authentication. | `string` | n/a | yes |
| <a name="input_server_profile_action"></a> [server\_profile\_action](#input\_server\_profile\_action) | Desired Action for the server profile (e.g., Deploy, Unassign) | `string` | `"No-op"` | no |
| <a name="input_vnic_name"></a> [vnic\_name](#input\_vnic\_name) | VNIC Ethernet Interface name | `string` | `"eth0"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->