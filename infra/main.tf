provider "intersight" {
  secretkey = var.secretkey
  apikey    = var.apikey
  endpoint  = var.endpoint
}

# Organization and other required Managed Object IDs (moids)
data "intersight_organization_organization" "org" {
  name = var.organization
}

data "intersight_compute_physical_summary" "server" {
  name  = var.server_list[count.index].name
  count = length(var.server_list)
}

data "intersight_access_policy" "imc_access" {
  name = "tf-k8s-SJC07-R14-15-access"
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org.id
  }
}

data "intersight_boot_precision_policy" "boot_order" {
  name = "tf-k8s-boot-policy"
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org.id
  }
}

data "intersight_vmedia_policy" "vmedia" {
  name = var.server_list[count.index].vmedia_policy
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org.id
  }
  count = length(var.server_list)
}

data "intersight_vnic_lan_connectivity_policy" "lan_connectivity" {
  name = "tf-k8s-lan-connectivity-policy"
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org.id
  }
}

# Server profiles
resource "intersight_server_profile" "profile" {
  name        = "SP-${var.server_list[count.index].name}"
  description = "Updated Profile for server name ${var.server_list[count.index].name}"
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org.id
  }
  target_platform        = var.server_list[count.index].target_platform
  server_assignment_mode = "Static"
  assigned_server {
    moid        = data.intersight_compute_physical_summary.server[count.index].id
    object_type = var.server_list[count.index].object_type
  }
  policy_bucket {
    object_type = "access.Policy"
    moid        = data.intersight_access_policy.imc_access.id
  }
  policy_bucket {
    object_type = "boot.PrecisionPolicy"
    moid        = data.intersight_boot_precision_policy.boot_order.id
  }
  policy_bucket {
    object_type = "vmedia.Policy"
    moid        = data.intersight_vmedia_policy.vmedia[count.index].id
  }
  policy_bucket {
    object_type = "vnic.LanConnectivityPolicy"
    moid        = data.intersight_vnic_lan_connectivity_policy.lan_connectivity.id
  }
  action = var.server_profile_action
  count  = length(var.server_list)
}
