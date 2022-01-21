# API key info
variable "secretkey" {
  type        = string
  description = "Filename (absolute path) or string of PEM formatted private key data to be used for Intersight API authentication."
}

variable "apikey" {
  type        = string
  description = "Public API Key ID"
}

variable "endpoint" {
  type        = string
  description = "URI used to access the Intersight API"
  default     = "https://www.intersight.com"
}

variable "organization" {
  type        = string
  description = "The name of the Organization this resource is assigned to"
  default     = "default"
}

variable "server_list" {
  type        = list(map(string))
  description = "Servers (identified by name, object_type, and target_platform) to assign to configured server profiles"
  default = [
    {
      name            = "SJC07-R14-FI-1-1-6",
      object_type     = "compute.Blade",
      target_platform = "FIAttached",
      vmedia_policy   = "tf-esxi67u3-248-232"
    }
  ]
}

variable "server_profile_action" {
  type        = string
  description = "Desired Action for the server profile (e.g., No-op, Deploy, Unassign)"
  default     = "Deploy"
}
