package k8srequiredlabels

import rego.v1

violation contains {"msg": msg, "details": {"missing_labels": missing}} if {
	provided := {label | input.review.object.metadata.labels[label]}
	required := {label | label := input.parameters.labels[_]}
	missing := required - provided
	count(missing) > 0
	msg := sprintf("you must provide labels: %v", [missing])
}
