param "allowed_subnet" {
    value = "aws_subnet.internal.id"
}

mock "tfplan/v2" {
    module {
        source = "mock-tfplan-v2-pass.sentinel"
    }
}

module "tfplan-functions" {
  source = "https://raw.githubusercontent.com/hashicorp/terraform-sentinel-policies/main/common-functions/tfplan-functions/tfplan-functions.sentinel"
}


test {
    rules = {
        main = true
    }
}