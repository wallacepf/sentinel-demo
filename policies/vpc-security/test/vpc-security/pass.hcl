param "allowed_subnet" {
    value = "aws_subnet.internal.id"
}

mock "tfconfig/v2" {
    module {
        source = "mock-tfconfig-v2-pass.sentinel"
    }
}

test {
    rules = {
        main = true
    }
}