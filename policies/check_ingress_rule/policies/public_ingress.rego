package terraform.policies.public_ingress

import rego.v1

import input.plan as tfplan

deny contains msg if {
	r := tfplan.resource_changes[_]
	r.type == "aws_security_group"
	r.change.after.ingress[_].cidr_blocks[_] == "0.0.0.0/0"
	msg := sprintf("%v has 0.0.0.0/0 as allowed ingress", [r.address])
}
