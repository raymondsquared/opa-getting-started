.PHONY: install-opa
install-opa:
	brew install opa

.PHONY: install-javascript
install-javascript:
	npm install

.PHONY: install
install: install-opa install-javascript

.PHONY: run-opa
run-opa:
	opa run --server policies/authz.rego

.PHONY: run-app
run-app:
	npm start

.PHONY: test-opa
test-opa:
	opa test policies/authz_test.rego policies/authz.rego -v

.PHONY: test
test: test-opa
