resource "tfe_registry_module" "rds-module" {
  vcs_repo {
    display_identifier = "wallacepf/terraform-provider-name"
    identifier         = "wallacepf/terraform-provider-name"
    oauth_token_id     = var.vcs_oauth_key
  }
}