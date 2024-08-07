# package httpapi.authz_test
package authz_test

import rego.v1

# import data.httpapi.authz
import data.authz

test_get_healthcheck_allowed if {
	authz.allow with input as {"path": "/health-check", "method": "GET"}
}

test_post_healthcheck_denied if {
	not authz.allow with input as {"path": "/health-check", "method": "POST"}
}

test_get_index_denied if {
	not authz.allow with input as {"path": "/", "method": "GET"}
}

test_post_index_denied if {
	not authz.allow with input as {"path": "/", "method": "POST"}
}

test_get_admin_denied if {
	not authz.allow with input as {"path": "/admin", "method": "GET", "roles": [""]}
}

test_post_admin_denied if {
	not authz.allow with input as {"path": "/admin", "method": "POST", "roles": [""]}
}

test_get_admin_with_admin_roles_allowed if {
	authz.allow with input as {"path": "/admin", "method": "GET", "roles": ["admin"]}
}

test_post_admin_with_admin_roles_denied if {
	not authz.allow with input as {"path": "/admin", "method": "POST", "roles": ["admin"]}
}
