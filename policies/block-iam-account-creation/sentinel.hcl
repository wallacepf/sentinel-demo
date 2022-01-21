mock {}

policy "deny-iam-user-creation" {
  source = "./block-iam-account-creation.sentinel"
  enforcement_level = "hard-mandatory"
}