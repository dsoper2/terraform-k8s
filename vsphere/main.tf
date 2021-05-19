provider "vsphere" {
  # Configuration options
  user           = var.vsphere_username
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # If you have a self-signed cert
  allow_unverified_ssl = var.allow_unverified_ssl
}

data "vsphere_datacenter" "dc" {
  name = var.dc
}

resource "vsphere_compute_cluster" "cluster" {
  name          = var.cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_host_thumbprint" "thumbprint" {
  address  = var.host_list[count.index].hostname
  insecure = var.allow_unverified_ssl
  count    = length(var.host_list)
}

resource "vsphere_host" "host" {
  hostname   = var.host_list[count.index].hostname
  username   = var.host_username
  password   = var.host_password
  cluster    = vsphere_compute_cluster.cluster.id
  thumbprint = data.vsphere_host_thumbprint.thumbprint[count.index].id
  count      = length(var.host_list)
}
