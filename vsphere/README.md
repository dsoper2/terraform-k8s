# terraform-k8s/infra
Example VMware vSphere hosts configuration for use in Terraform Cloud for Business.

For a step-by-step overview of setting up the Intersight Service for Terraform and configuring Terraform Cloud Workspaces, please see https://cdn.intersight.com/components/an-hulk/1.0.9-749/docs/cloud/data/resources/terraform-service/en/Cisco_IST_Getting_Started_Guide.pdf

## Usage
* Fork this repository into your own GitHub account
* Create a workspace in Terraform Cloud (https://www.terraform.io/docs/cloud/workspaces/index.html)
* Select your version control workflow
* Select your GitHub account and choose your forked repository
* Go to General Settings and change the execution mode to Agent and select your agent.
* Go to Variables and add any needed variables as specified below

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.4 |
| <a name="requirement_vsphere"></a> [vsphere](#requirement\_vsphere) | >= 1.24.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vsphere"></a> [vsphere](#provider\_vsphere) | >= 1.24.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vsphere_compute_cluster.cluster](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/compute_cluster) | resource |
| [vsphere_host.host](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/host) | resource |
| [vsphere_datacenter.dc](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/datacenter) | data source |
| [vsphere_host_thumbprint.thumbprint](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/host_thumbprint) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_unverified_ssl"></a> [allow\_unverified\_ssl](#input\_allow\_unverified\_ssl) | Whether or not self-signed certificates are allowed | `bool` | `true` | no |
| <a name="input_cluster"></a> [cluster](#input\_cluster) | Name of the compute cluster in vCenter | `string` | `null` | no |
| <a name="input_dc"></a> [dc](#input\_dc) | Name of the datacenter within vCenter | `string` | `null` | no |
| <a name="input_host_list"></a> [host\_list](#input\_host\_list) | A list of hosts to add to vCenter | `list(map(string))` | `null` | no |
| <a name="input_host_password"></a> [host\_password](#input\_host\_password) | ESXi host password | `string` | `null` | no |
| <a name="input_host_username"></a> [host\_username](#input\_host\_username) | ESXi host username | `string` | `null` | no |
| <a name="input_vsphere_password"></a> [vsphere\_password](#input\_vsphere\_password) | vCenter password | `string` | `null` | no |
| <a name="input_vsphere_server"></a> [vsphere\_server](#input\_vsphere\_server) | vCenter hostname or IP address | `string` | `null` | no |
| <a name="input_vsphere_username"></a> [vsphere\_username](#input\_vsphere\_username) | vCenter username | `string` | `null` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->