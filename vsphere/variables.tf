variable "vsphere_username" {
  type        = string
  description = "vCenter username"
  default     = null
}

variable "vsphere_password" {
  type        = string
  description = "vCenter password"
  default     = null
}

variable "vsphere_server" {
  type        = string
  description = "vCenter hostname or IP address"
  default     = null
}

variable "allow_unverified_ssl" {
  type        = bool
  description = "Whether or not self-signed certificates are allowed"
  default     = true
}

variable "dc" {
  type        = string
  description = "Name of the datacenter within vCenter"
  default     = null
}

variable "cluster" {
  type        = string
  description = "Name of the compute cluster in vCenter"
  default     = null
}

variable "host_username" {
  type        = string
  description = "ESXi host username"
  default     = null
}

variable "host_password" {
  type        = string
  description = "ESXi host password"
  default     = null
}

variable "host_list" {
  type        = list(map(string))
  description = "A list of hosts to add to vCenter"
  default     = null
}
