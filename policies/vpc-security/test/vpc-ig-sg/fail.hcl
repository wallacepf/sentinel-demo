

mock "tfplan/v2" {
    module {
        source = "mock-tfplan-v2-fail.sentinel"
    }
}

module "tfplan-functions" {
    source = "https://raw.githubusercontent.com/hashicorp/terraform-guides/master/governance/third-generation/common-functions/tfplan-functions/tfplan-functions.sentinel"

}

test {
    rules = {
        main = false
    }
}