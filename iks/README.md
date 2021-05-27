# terraform-k8s/infra
Example Intersight Kubernetes Serivce (IKS) Profile configuration for use in Terraform Cloud for Business.  Note that a complete example of configuring IKS with Terraform is available at https://registry.terraform.io/modules/terraform-cisco-modules/iks/intersight/latest

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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.14.5 |
| <a name="requirement_intersight"></a> [intersight](#requirement\_intersight) | >=1.0.8 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_intersight"></a> [intersight](#provider\_intersight) | >=1.0.8 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [intersight_kubernetes_cluster_profile.iks_profile](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/kubernetes_cluster_profile) | resource |
| [intersight_organization_organization.organization_moid](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apikey"></a> [apikey](#input\_apikey) | API Key | `string` | n/a | yes |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | API Endpoint URL | `string` | `"https://www.intersight.com"` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | Organization Name | `string` | `"default"` | no |
| <a name="input_secretkey"></a> [secretkey](#input\_secretkey) | Secret Key or file location | `string` | n/a | yes |
| <a name="input_ssh_key"></a> [ssh\_key](#input\_ssh\_key) | SSH Public Key to be used to node login. | `string` | `null` | no |
| <a name="input_ssh_user"></a> [ssh\_user](#input\_ssh\_user) | SSH Username for node login. | `string` | `"iksadmin"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `list(map(string))` | `[]` | no |
| <a name="input_vsphere_password"></a> [vsphere\_password](#input\_vsphere\_password) | Password of the account to be used with vCenter.  This should be the password for the account used to register vCenter with Intersight. | `string` | `null` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->