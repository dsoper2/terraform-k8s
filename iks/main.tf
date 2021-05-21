provider "intersight" {
  apikey    = var.apikey
  secretkey = var.secretkey
  endpoint  = var.endpoint
}

# Organization and other required Managed Object IDs (moids)
data "intersight_organization_organization" "organization_moid" {
  name = var.organization
}

resource "intersight_kubernetes_cluster_profile" "iks_profile" {
  /*
  depends_on = [
        intersight_kubernetes_node_group_profile.masternodegrp
  ]
  action = "Deploy"
  */
  name = "tf-sjc07-r14"
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.organization_moid.id
  }

}

/*
module "terraform-intersight-iks" {
  source = "terraform-cisco-modules/iks/intersight//"
  # Infra Config Policy Information
  cluster_name = "tf-sjc07-r14"
  # cluster_action   = "Deploy"
  # vc_target_name   = "cc7tmevc.tmedemo.cisco.com"
  vc_target_name   = "172.28.225.220"
  vc_portgroup     = ["panther|triggerMesh|tme"]
  vc_datastore     = "datastore1 (11)"
  vc_cluster       = "TF-R14-IKS"
  vc_resource_pool = ""
  vc_password      = var.vsphere_password

  # IP Pool Information
  ip_starting_address = "172.22.248.235"
  ip_pool_size        = "5"
  ip_netmask          = "255.255.252.0"
  ip_gateway          = "172.22.248.1"
  ip_primary_dns      = "172.28.224.72"
  ip_secondary_dns    = "171.70.168.183"

  # Network Configuration Settings
  # pod_cidr = "100.65.0.0/16"
  # service_cidr = "100.64.0.0/24"
  # cni = "Calico"
  domain_name    = "intersightdemo.cisco.com"
  timezone       = "America/Los_Angeles"
  ip_primary_ntp = "ntp.esl.cisco.com"
  # unsigned_registries = ["10.101.128.128"]
  # root_ca_registries  = [""]

  # Cluster information
  ssh_user       = var.ssh_user
  ssh_key        = var.ssh_key
  worker_size    = "small"
  worker_count   = 1
  master_count   = 1
  load_balancers = 1
  # Organization and Tag
  organization = var.organization
  tags         = var.tags
}
*/
