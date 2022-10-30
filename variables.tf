variable "api_token" {
  type        = string
  description = "Api token with admin privileges for your okta organisation"
}

variable "org_name" {
  type        = string
  description = "Your Okta organisation name (i.e. apono)"
}

variable "okta_base_url" {
  type = string
  description = "Your okta domain base url (i.e. okta.com)"
}
