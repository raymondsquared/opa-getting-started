# package httpapi.authz
package authz

import rego.v1

default allow := false

allow if {
	input.method == "GET"
	input.path in ["/health-check"]
}

allow if {
	is_admin
	input.method == "GET"
	input.path in ["/admin"]
}

is_admin if {
	some role in input.roles
	role in ["admin", "super-admin"]
}
