This project is a terraform project that creates an integration OAuth app inside your Okta organisation, for Apono to execute dip sync

### Execute Steps
1. clone this repo
2. `cd apono-okta-integration-tf`
3. execute terraform with `terraform apply`
   1. this will require few input variables:
      1. `api_token` - an API token with admin privileges (belonging to admin user)
      2. `org_name` - your organisation id in Okta (i.e. apono)
      3. `okta_base_url` (Optional) - you okta base url in case it differs from **okta.com**