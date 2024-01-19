resource "tfe_variable_set" "vset-jit" {
  name         = "Workload ID Config"
  organization = local.org
}

resource "tfe_project_variable_set" "proj-vset" {
  variable_set_id = tfe_variable_set.vset-jit.id
  project_id      = tfe_project.demo-29062023.id
}

resource "tfe_variable" "jit-vault-enable" {
  key             = "TFC_VAULT_PROVIDER_AUTH"
  value           = true
  category        = "env"
  description     = "JIT"
  variable_set_id = tfe_variable_set.vset-jit.id
}

resource "tfe_variable" "jit-vault-addr" {
  key             = "TFC_VAULT_ADDR"
  value           = "https://hcp-vault-demo.vault.5bbc50e3-a284-4743-877e-ffd388d684f2.aws.hashicorp.cloud:8200"
  category        = "env"
  description     = "JIT"
  variable_set_id = tfe_variable_set.vset-jit.id
}

resource "tfe_variable" "jit-vault-role" {
  key             = "TFC_VAULT_RUN_ROLE"
  value           = "demo"
  category        = "env"
  description     = "JIT"
  variable_set_id = tfe_variable_set.vset-jit.id
}

resource "tfe_variable" "jit-vault-namespace" {
  key             = "TFC_VAULT_NAMESPACE"
  value           = "admin/demo"
  category        = "env"
  description     = "JIT"
  variable_set_id = tfe_variable_set.vset-jit.id
}

resource "tfe_variable" "jit-vault-mount-path" {
  key             = "TFC_VAULT_AUTH_PATH"
  value           = "tf-jwt"
  category        = "env"
  description     = "JIT"
  variable_set_id = tfe_variable_set.vset-jit.id
}

resource "tfe_variable" "jit-vault-aws-enable" {
  key             = "TFC_VAULT_BACKED_AWS_AUTH"
  value           = true
  category        = "env"
  description     = "JIT"
  variable_set_id = tfe_variable_set.vset-jit.id
}

resource "tfe_variable" "jit-vault-aws-type" {
  key             = "TFC_VAULT_BACKED_AWS_AUTH_TYPE"
  value           = "assumed_role"
  category        = "env"
  description     = "JIT"
  variable_set_id = tfe_variable_set.vset-jit.id
}

resource "tfe_variable" "jit-vault-aws-role-arn" {
  key             = "TFC_VAULT_BACKED_AWS_RUN_ROLE_ARN"
  value           = "arn:aws:iam::940345621114:role/hcp-vault-role-tf-demo"
  category        = "env"
  description     = "JIT"
  variable_set_id = tfe_variable_set.vset-jit.id
}

resource "tfe_variable" "jit-vault-aws-role" {
  key             = "TFC_VAULT_BACKED_AWS_RUN_VAULT_ROLE"
  value           = "demo"
  category        = "env"
  description     = "JIT"
  variable_set_id = tfe_variable_set.vset-jit.id
}
