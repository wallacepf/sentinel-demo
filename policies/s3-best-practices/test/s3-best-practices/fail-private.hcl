module "tfplan-functions" {
  source = "https://raw.githubusercontent.com/hashicorp/terraform-sentinel-policies/main/common-functions/tfplan-functions/tfplan-functions.sentinel"
}

mock "tfplan/v2" {
    module {
        source = "mock-tfplan-v2-fail-private.sentinel"
    }
}

test {
    rules = {
        main = false
    }
}