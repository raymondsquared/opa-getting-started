# package httpapi.authz_test
package authz_test

import rego.v1

# import data.httpapi.authz
import data.authz

test_get_menu_denied if {
	not authz.allow with input as {"path": ["/menu"], "method": "GET"}
}

test_post_menu_denied if {
	not authz.allow with input as {"path": "/menu", "method": "POST"}
}

test_get_menu_with_user_role_allowed if {
	not authz.allow with input as {"path": "/menu", "method": "GET", "transportHeaders": {"wso-role": "user"}}
}

test_get_menu_with_admin_role_allowed if {
	authz.allow with input as {"path": "/menu", "method": "GET", "transportHeaders": {"wso-role": "admin"}}
}

test_get_menu_with_super_admin_role_allowed if {
	authz.allow with input as {"path": "/menu", "method": "GET", "transportHeaders": {"wso-role": "super-admin"}}
}
