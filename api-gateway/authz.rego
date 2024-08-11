# package httpapi.authz
package authz

import rego.v1

default allow := false

is_admin if {
	input.transportHeaders["wso-role"] in ["admin", "super-admin"]
}

allow if {
	is_admin
	input.method == "GET"
	input.path in ["/menu"]
}
