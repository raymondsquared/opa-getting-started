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
	opa run --server authz.rego

.PHONY: run-app
run-app:
	npm start

.PHONY: test-opa
test-opa:
	opa test authz_test.rego

.PHONY: test
test: test-opa
