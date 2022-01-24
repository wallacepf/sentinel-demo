// mock "tfconfig/v2" {
//     module {
//         source = "testdata/mock-tfconfig-v2.sentinel"
//     }
// }

// param "allowed_subnet" {
//     value = "aws_subnet.internal.id"
// }

policy "instance-subnet-allowed" {
  source = "./vpc-security.sentinel"
  enforcement_level = "soft-mandatory"
}