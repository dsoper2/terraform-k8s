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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.3 |
| <a name="requirement_intersight"></a> [intersight](#requirement\_intersight) | >= 1.0.21 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_intersight"></a> [intersight](#provider\_intersight) | >= 1.0.21 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [intersight_server_profile.profile](https://registry.terraform.io/providers/ciscodevnet/intersight/latest/docs/resources/server_profile) | resource |
| [intersight_access_policy.imc_access](https://registry.terraform.io/providers/ciscodevnet/intersight/latest/docs/data-sources/access_policy) | data source |
| [intersight_boot_precision_policy.boot_order](https://registry.terraform.io/providers/ciscodevnet/intersight/latest/docs/data-sources/boot_precision_policy) | data source |
| [intersight_compute_physical_summary.server](https://registry.terraform.io/providers/ciscodevnet/intersight/latest/docs/data-sources/compute_physical_summary) | data source |
| [intersight_organization_organization.org](https://registry.terraform.io/providers/ciscodevnet/intersight/latest/docs/data-sources/organization_organization) | data source |
| [intersight_vmedia_policy.vmedia](https://registry.terraform.io/providers/ciscodevnet/intersight/latest/docs/data-sources/vmedia_policy) | data source |
| [intersight_vnic_lan_connectivity_policy.lan_connectivity](https://registry.terraform.io/providers/ciscodevnet/intersight/latest/docs/data-sources/vnic_lan_connectivity_policy) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apikey"></a> [apikey](#input\_apikey) | Public API Key ID | `string` | n/a | yes |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | URI used to access the Intersight API | `string` | `"https://www.intersight.com"` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | The name of the Organization this resource is assigned to | `string` | `"default"` | no |
| <a name="input_secretkey"></a> [secretkey](#input\_secretkey) | Filename (absolute path) or string of PEM formatted private key data to be used for Intersight API authentication. | `string` | n/a | yes |
| <a name="input_server_list"></a> [server\_list](#input\_server\_list) | Servers (identified by name, object\_type, and target\_platform) to assign to configured server profiles | `list(map(string))` | <pre>[<br>  {<br>    "name": "SJC07-R14-FI-1-1-6",<br>    "object_type": "compute.Blade",<br>    "target_platform": "FIAttached",<br>    "vmedia_policy": "tf-esxi67u3-248-232"<br>  }<br>]</pre> | no |
| <a name="input_server_profile_action"></a> [server\_profile\_action](#input\_server\_profile\_action) | Desired Action for the server profile (e.g., No-op, Deploy, Unassign) | `string` | `"Deploy"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->