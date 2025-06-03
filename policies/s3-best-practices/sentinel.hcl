module "tfplan-functions" {
  source = "https://raw.githubusercontent.com/hashicorp/terraform-sentinel-policies/main/common-functions/tfplan-functions/tfplan-functions.sentinel"
}

# mock "tfplan/v2" {
#   module {
#     source = "testdata/mock-tfplan-v2.sentinel"
#   }
# }

policy "s3-best-practices" {
  source = "./s3-best-practices.sentinel"
  enforcement_level = "hard-mandatory"
}