package terraform

import rego.v1

default allow := false

allow if {
	some resource in input.planned_values.root_module.resources
	is_s3_bucket(resource)
	has_required_tag(resource.values.tags)
}

is_s3_bucket(resource) if {
	resource.type == "aws_s3_bucket"
}

has_required_tag(tags) if {
	required_tag := {
		"key": "environment",
		"values": ["development", "staging", "production"]
	}

	tags[required_tag.key] in required_tag.values
}
