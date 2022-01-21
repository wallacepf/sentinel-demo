module "tfplan-functions" {
    source = "https://raw.githubusercontent.com/hashicorp/terraform-guides/master/governance/third-generation/common-functions/tfplan-functions/tfplan-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "./testdata/mock-tfplan-v2.sentinel"
  }
}

policy "deny-iam-user-creation" {
  source = "./block-iam-account-creation.sentinel"
  enforcement_level = "hard-mandatory"
}