resource "tfe_registry_module" "rds-module" {
  vcs_repo {
    display_identifier = "wallacepf/terraform-aws-rds"
    identifier         = "wallacepf/terraform-aws-rds"
    oauth_token_id     = var.vcs_oauth_key
  }
}