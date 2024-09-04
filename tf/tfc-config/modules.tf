resource "tfe_registry_module" "rds-module" {
  vcs_repo {
    display_identifier = "wallacepf/terraform-aws-rds"
    identifier         = "wallacepf/terraform-aws-rds"
    oauth_token_id     = data.tfe_oauth_client.client.oauth_token_id
  }
}

resource "tfe_no_code_module" "foobar" {
    organization = local.org
    registry_module = tfe_registry_module.rds-module.id
}