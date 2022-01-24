terraform {
  required_providers {
    okta = {
      source = "okta/okta"
      version = "~> 3.20"
    }
  }
}

locals {
  domain_name = "${var.org_name}.${var.okta_base_url}"
  issuer = "https://${local.domain_name}"
}

# Configure the Okta Provider
provider "okta" {
  org_name  = var.org_name
  base_url  = var.okta_base_url
  api_token = var.api_token
}

resource "okta_app_oauth" "apono-integration" {
  label          = "Apono Integration"
  type           = "service"
  response_types = ["token"]
  grant_types    = ["client_credentials"]
  token_endpoint_auth_method = "private_key_jwt"

  jwks {
    kty = "RSA"
    kid = "c90fab69-f5cb-4975-97c1-87bb2688be8e"
    e   = "AQAB"
    n   = "rlN2Sq1LPsQj4BOS1lSN6KSuQBWT_okRZVnGQmrMYtX_n3QIOTtYYwBWPgU6b3GugyUc5v51gtykRbUXeoprfXcCfU3C2UUhzPOL8ZnIOVity5pk_9aFNHhGp6k_yGjadLOLxKUNFBh7X0-W_simDSf6EFOGU3EQjO5PUkyEXipp95kDBseh-lmv5nGHDaeqLDEzCPyptgBxg8pzUQM5t9o97fbSvy7qptg-RArF759dnHmva5W94tzO03gwhMNiI_0UlIG3TTg9K8DTcVTI0lS4CFdf7BpRQnurk6kb1UC7UE2RCPZO_E-mxaenTu6ckEx-1N6v0q_x5xJRW8rp9w"
  }
}

resource "okta_app_oauth_api_scope" "apono-integration-users-read" {
  app_id = okta_app_oauth.apono-integration.id
  issuer = local.issuer
  scopes = ["okta.users.read", "okta.groups.read"]
}

output "app-client-id" {
  value = okta_app_oauth.apono-integration.id
}

output "domain-name" {
  value = local.domain_name
}
