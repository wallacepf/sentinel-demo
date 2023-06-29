resource "tfe_registry_module" "rds-module" {
  vcs_repo {
    display_identifier = "wallacepf/terraform-aws-rd"
    identifier         = "wallacepf/terraform-provider-rds"
    oauth_token_id     = var.vcs_oauth_key
  }
}