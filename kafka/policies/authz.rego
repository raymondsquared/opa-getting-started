package kafka.authz

import rego.v1

default allow := false

allow if {
	not deny
}

deny if {
	is_write
	is_denied_topic
}

is_write if {
	input.action.operation == "WRITE"
}

is_denied_topic if {
	input.action.resourcePattern.resourceType == "TOPIC"
	input.action.resourcePattern.name == "raymond.denied"
}
