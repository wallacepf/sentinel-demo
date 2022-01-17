mock "tfplan/v2" {
  module {
    source = "./testdata/mock-tfplan-v2.sentinel"
  }
}

policy "deny-iam-user-creation" {
  source = "./block-iam-account-creation.sentinel"
  enforcement_level = "soft-mandatory"
}