module "tfplan-functions" {
  source = "https://raw.githubusercontent.com/hashicorp/terraform-sentinel-policies/main/common-functions/tfplan-functions/tfplan-functions.sentinel"
}

module "tfconfig-functions" {
    source = "https://raw.githubusercontent.com/hashicorp/terraform-sentinel-policies/main/common-functions/tfconfig-functions/tfconfig-functions.sentinel"
}

module "aws-functions" {
    source = "https://raw.githubusercontent.com/hashicorp/terraform-sentinel-policies/main/aws/aws-functions/aws-functions.sentinel"

}

mock "tfplan/v2" {
    module {
        source = "mock-tfplan-v2-pass.sentinel"
    }
}

mock "tfconfig/v2" {
    module {
        source = "mock-tfconfig-v2.sentinel"
    }
}

test {
    rules = {
        main = true
    }
}