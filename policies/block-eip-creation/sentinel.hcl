module "tfplan-functions" {
    source = "https://raw.githubusercontent.com/hashicorp/terraform-guides/master/governance/third-generation/common-functions/tfplan-functions/tfplan-functions.sentinel"
}

// mock "tfplan/v2" {
//   module {
//     source = "./testdata/mock-tfplan-v2.sentinel"
//   }
// }

policy "deny-eip-creation" {
  source = "./block-eip-creation.sentinel"
  enforcement_level = "advisory"
}
