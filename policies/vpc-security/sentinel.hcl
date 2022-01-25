// param "allowed_subnet" {
//     value = "aws_subnet.internal.id"
// }

module "tfplan-functions" {
    source = "https://raw.githubusercontent.com/hashicorp/terraform-guides/master/governance/third-generation/common-functions/tfplan-functions/tfplan-functions.sentinel"

}

// mock "tfplan/v2" {
//     module {
//         source = "testdata/mock-tfplan-v2.sentinel"
//     }
// }

// mock "tfconfig/v2" {
//     module {
//         source = "testdata/mock-tfconfig-v2.sentinel"
//     }
// }

policy "instance-subnet-allowed" {
  source = "./vpc-subnet.sentinel"
  enforcement_level = "soft-mandatory"
}

policy "instance-ig-sg-allowed" {
  source = "./vpc-ig-sg.sentinel"
  enforcement_level = "soft-mandatory"
}